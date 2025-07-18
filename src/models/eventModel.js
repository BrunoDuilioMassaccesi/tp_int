const pool = require('../../config/db');

const getEvents = async ({ page = 1, limit = 10, name, startdate, tag }) => {
  let query = `SELECT e.*, u.id as user_id, u.first_name, u.last_name, u.username, u.password, el.id as event_location_id, el.name as event_location_name, el.full_address, el.max_capacity, el.latitude, el.longitude, el.id_creator_user
    FROM events e
    LEFT JOIN users u ON e.id_creator_user = u.id
    LEFT JOIN event_locations el ON e.id_event_location = el.id`;
  let where = [];
  let params = [];
  if (name) { where.push(`e.name ILIKE $${params.length + 1}`); params.push(`%${name}%`); }
  if (startdate) { where.push(`e.start_date = $${params.length + 1}`); params.push(startdate); }
  if (tag) {
    query += ' LEFT JOIN event_tags et ON e.id = et.id_event LEFT JOIN tags t ON et.id_tag = t.id';
    where.push(`t.name ILIKE $${params.length + 1}`); params.push(`%${tag}%`);
  }
  if (where.length) query += ' WHERE ' + where.join(' AND ');
  query += ` ORDER BY e.id LIMIT $${params.length + 1} OFFSET $${params.length + 2}`;
  params.push(limit, (page - 1) * limit);
  const res = await pool.query(query, params);
  return res.rows;
};

const getEventById = async (id) => {
  const query = `SELECT e.*, el.*, l.*, p.*, u.id as user_id, u.first_name, u.last_name, u.username, u.password
    FROM events e
    LEFT JOIN event_locations el ON e.id_event_location = el.id
    LEFT JOIN locations l ON el.id_location = l.id
    LEFT JOIN provinces p ON l.id_province = p.id
    LEFT JOIN users u ON e.id_creator_user = u.id
    WHERE e.id = $1`;
  const res = await pool.query(query, [id]);
  if (!res.rows.length) return null;
  const tagsRes = await pool.query('SELECT t.* FROM event_tags et JOIN tags t ON et.id_tag = t.id WHERE et.id_event = $1', [id]);
  return { ...res.rows[0], tags: tagsRes.rows };
};

module.exports = { getEvents, getEventById };

const pool = require('../../config/db');

const getEventLocations = async (userId, page = 1, limit = 10) => {
  const res = await pool.query('SELECT * FROM event_locations WHERE id_creator_user = $1 ORDER BY id LIMIT $2 OFFSET $3', [userId, limit, (page-1)*limit]);
  return res.rows;
};

const getEventLocationById = async (id, userId) => {
  const res = await pool.query('SELECT * FROM event_locations WHERE id = $1 AND id_creator_user = $2', [id, userId]);
  return res.rows[0];
};

const createEventLocation = async (data) => {
  const { id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user } = data;
  const res = await pool.query('INSERT INTO event_locations (id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user) VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING *', [id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user]);
  return res.rows[0];
};

const updateEventLocation = async (id, data, userId) => {
  const res = await pool.query('UPDATE event_locations SET id_location=$1, name=$2, full_address=$3, max_capacity=$4, latitude=$5, longitude=$6 WHERE id=$7 AND id_creator_user=$8 RETURNING *', [data.id_location, data.name, data.full_address, data.max_capacity, data.latitude, data.longitude, id, userId]);
  return res.rows[0];
};

const deleteEventLocation = async (id, userId) => {
  await pool.query('DELETE FROM event_locations WHERE id = $1 AND id_creator_user = $2', [id, userId]);
};

module.exports = { getEventLocations, getEventLocationById, createEventLocation, updateEventLocation, deleteEventLocation };

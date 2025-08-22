const pool = require('../../config/db');

exports.listEvents = async (req, res) => {
  try {
    let sql = 'SELECT * FROM events';
    let params = [];
    let where = [];
    if (req.query.name) {
      where.push('name ILIKE $' + (params.length + 1));
      params.push('%' + req.query.name + '%');
    }
    if (req.query.startdate) {
      where.push('start_date = $' + (params.length + 1));
      params.push(req.query.startdate);
    }
    if (where.length) sql += ' WHERE ' + where.join(' AND ');
    const result = await pool.query(sql, params); 
    const contextUser = req.context ? req.context.username : null;
    res.json({ events: result.rows, requestedBy: contextUser });
  } catch (error) {
    res.status(500).json({ error: 'Error al listar eventos', details: error.message });
  }
};

exports.getEventDetail = async (req, res) => {
  try {
    const id = req.params.id;
    const result = await pool.query('SELECT * FROM events WHERE id = $1', [id]);
    if (!result.rows.length) return res.status(404).json({ msg: 'No existe el evento' });
    const contextUser = req.context ? req.context.username : null;
    res.json({ event: result.rows[0], requestedBy: contextUser });
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener detalle del evento', details: error.message });
  }
};

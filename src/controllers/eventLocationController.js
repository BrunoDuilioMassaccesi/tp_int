const pool = require('../../config/db');

exports.listEventLocations = async (req, res) => {
  const result = await pool.query('SELECT * FROM event_locations');
  res.json(result.rows);
};

exports.getEventLocationDetail = async (req, res) => {
  const id = req.params.id;
  const result = await pool.query('SELECT * FROM event_locations WHERE id = $1', [id]);
  if (!result.rows.length) return res.status(404).json({ msg: 'No existe la ubicación' });
  res.json(result.rows[0]);
};

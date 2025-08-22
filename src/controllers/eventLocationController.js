const pool = require('../../config/db');

exports.listEventLocations = async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM event_locations');
    const contextUser = req.context ? req.context.username : null;
    res.json({ locations: result.rows, requestedBy: contextUser });
  } catch (error) {
    res.status(500).json({ error: 'Error al listar ubicaciones', details: error.message });
  }
};

exports.getEventLocationDetail = async (req, res) => {
  try {
    const id = req.params.id;
    const result = await pool.query('SELECT * FROM event_locations WHERE id = $1', [id]);
    if (!result.rows.length) return res.status(404).json({ msg: 'No existe la ubicación' });
    const contextUser = req.context ? req.context.username : null;
    res.json({ location: result.rows[0], requestedBy: contextUser });
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener detalle de ubicación', details: error.message });
  }
};

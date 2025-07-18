const express = require('express');
const app = express();
const pool = require('../config/db');
app.use(express.json());

app.get('/', (req, res) => {
  res.send('Hola, esto es el TP de eventos.');
});

app.get('/api/event', async (req, res) => {
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
  res.json(result.rows);
});

app.get('/api/event/:id', async (req, res) => {
  const id = req.params.id;
  const result = await pool.query('SELECT * FROM events WHERE id = $1', [id]);
  if (!result.rows.length) return res.status(404).json({ msg: 'No existe el evento' });
  res.json(result.rows[0]);
});

app.listen(3000, () => {
  console.log('Servidor andando en http://localhost:3000');
});

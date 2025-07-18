const pool = require('../../config/db');

const getUserByUsername = async (username) => {
  const res = await pool.query('SELECT * FROM users WHERE username = $1', [username]);
  return res.rows[0];
};

const createUser = async ({ first_name, last_name, username, password }) => {
  const res = await pool.query(
    'INSERT INTO users (first_name, last_name, username, password) VALUES ($1, $2, $3, $4) RETURNING *',
    [first_name, last_name, username, password]
  );
  return res.rows[0];
};

module.exports = { getUserByUsername, createUser };

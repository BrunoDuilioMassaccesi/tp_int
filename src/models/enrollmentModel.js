const pool = require('../../config/db');

const getEnrollment = async (eventId, userId) => {
  const res = await pool.query('SELECT * FROM event_enrollments WHERE id_event = $1 AND id_user = $2', [eventId, userId]);
  return res.rows[0];
};

const createEnrollment = async (eventId, userId, description) => {
  const res = await pool.query('INSERT INTO event_enrollments (id_event, id_user, description, registration_date_time, attended) VALUES ($1, $2, $3, CURRENT_DATE, 0) RETURNING *', [eventId, userId, description]);
  return res.rows[0];
};

const deleteEnrollment = async (eventId, userId) => {
  await pool.query('DELETE FROM event_enrollments WHERE id_event = $1 AND id_user = $2', [eventId, userId]);
};

module.exports = { getEnrollment, createEnrollment, deleteEnrollment };

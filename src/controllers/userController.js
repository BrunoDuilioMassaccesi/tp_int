const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const Joi = require('joi');
const userModel = require('../models/userModel');

const login = async (req, res) => {
  const { username, password } = req.body;
  const user = await userModel.getUserByUsername(username);
  if (!user) {
    return res.status(401).json({ success: false, message: 'Usuario o clave inválida.', token: '' });
  }

  let valid = false;
  try {
    valid = await bcrypt.compare(password, user.password);
  } catch (e) {
    valid = false;
  }
  if (!valid) {

    valid = password === user.password;
  }
  if (!valid) {
    return res.status(401).json({ success: false, message: 'Usuario o clave inválida.', token: '' });
  }
  const token = jwt.sign({ id: user.id, first_name: user.first_name, last_name: user.last_name, username: user.username }, process.env.JWT_SECRET);
  res.json({ success: true, message: '', token });
};

const register = async (req, res) => {
  const schema = Joi.object({
    first_name: Joi.string().min(3).required(),
    last_name: Joi.string().min(3).required(),
    username: Joi.string().min(3).required(),
    password: Joi.string().min(3).required()
  });
  const { error } = schema.validate(req.body);
  if (error) {
    return res.status(400).json({ success: false, message: error.details[0].message });
  }
  const userExists = await userModel.getUserByUsername(req.body.username);
  if (userExists) {
    return res.status(400).json({ success: false, message: 'El usuario ya existe.' });
  }
  const hashedPassword = await bcrypt.hash(req.body.password, 10);
  const user = await userModel.createUser({ ...req.body, password: hashedPassword });
  res.status(201).json({ success: true, user });
};

module.exports = { login, register };

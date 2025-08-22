const jwt = require('jsonwebtoken');

module.exports = (req, res, next) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  if (!token) return res.status(401).json({ message: 'No token provided.' });
  jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
    if (err) return res.status(401).json({ message: 'Token inválido.' });
    req.user = user;
    req.context = {
      userId: user.id,
      username: user.username,
      firstName: user.first_name,
      lastName: user.last_name
    };
    next();
  });
};

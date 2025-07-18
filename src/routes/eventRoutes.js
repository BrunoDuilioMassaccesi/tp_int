const express = require('express');
const router = express.Router();
const eventController = require('../controllers/eventController');
const auth = require('../middleware/auth');

router.get('/', eventController.listEvents);
router.get('/:id', eventController.getEventDetail);
router.post('/', auth, eventController.createEvent);
router.put('/', auth, eventController.updateEvent);
router.delete('/:id', auth, eventController.deleteEvent);
router.post('/:id/enrollment', auth, eventController.enrollEvent);
router.delete('/:id/enrollment', auth, eventController.unenrollEvent);

module.exports = router;

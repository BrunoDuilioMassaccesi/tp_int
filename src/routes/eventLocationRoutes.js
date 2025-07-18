const express = require('express');
const router = express.Router();
const eventLocationController = require('../controllers/eventLocationController');
const auth = require('../middleware/auth');

router.get('/', auth, eventLocationController.listEventLocations);
router.get('/:id', auth, eventLocationController.getEventLocationDetail);
router.post('/', auth, eventLocationController.createEventLocation);
router.put('/', auth, eventLocationController.updateEventLocation);
router.delete('/:id', auth, eventLocationController.deleteEventLocation);

module.exports = router;

const router = require('express').Router()
const { AutorisationController } = require('../controllers')

router.get('/', AutorisationController.index)
router.get('/:id([0-9]+)', AutorisationController.show)
router.post('/', AutorisationController.create)
router.patch('/:id([0-9]+)', AutorisationController.update)
router.delete('/:id([0-9]+)', AutorisationController.delete)
//router.get('/', AutorisationController.logout)

module.exports = router;
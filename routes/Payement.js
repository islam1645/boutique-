const router = require('express').Router()
const { PayementController } = require('../controllers')
//router.get('/Payement', PayementController.get)
router.get('/', PayementController.index)
router.get('/:id([0-9]+)', PayementController.show)
router.post('/', PayementController.create)
router.patch('/:id([0-9]+)', PayementController.update)
router.delete('/:id([0-9]+)', PayementController.delete)

module.exports = router;
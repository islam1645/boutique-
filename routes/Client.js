const router = require('express').Router()
const {ClientController} = require('../controllers')

router.get('/',ClientController.index)
router.get('/:id([0-9]+)',ClientController.show)
router.post('/',ClientController.create)
router.patch('/:id([0-9]+)',ClientController.update)
router.delete('/:id([0-9]+)',ClientController.delete)

module.exports  = router;
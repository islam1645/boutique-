const router = require('express').Router()
const {cathegorieController} = require('../controllers')

router.get('/',cathegorieController.index)
router.get('/:id([0-9]+)',cathegorieController.show)
router.post('/',cathegorieController.create)
router.patch('/:id([0-9]+)',cathegorieController.update)
router.delete('/:id([0-9]+)',cathegorieController.delete)

module.exports  = router;
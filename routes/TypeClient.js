const router = require('express').Router()
const {TypeClientController} = require('../controllers')
const {isAuth} = require('../middlewares/Auth')
router.get('/',TypeClientController.index)
router.get('/:id([0-9]+)',TypeClientController.show)
router.post('/',TypeClientController.create)
router.patch('/:id([0-9]+)',TypeClientController.update)
router.delete('/:id([0-9]+)',TypeClientController.delete)

module.exports  = router;
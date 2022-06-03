const router = require('express').Router()
const { UserController } = require('../controllers')
const ParseParams = require('../middlewares/ParseQuery')
const { isAuth } = require('../middlewares/Auth')
router.get('/', ParseParams, UserController.index)
router.get('/:id([0-9]+)', isAuth(), UserController.show)
router.get('/count', UserController.count)
router.post('/', isAuth(1), UserController.create)
router.patch('/:id([0-9]+)', isAuth(2), UserController.update)
router.delete('/:id([0-9]+)', isAuth(2), UserController.delete)

module.exports = router;
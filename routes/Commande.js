const router = require('express').Router()
const { CommandeController } = require('../controllers')
const { isAuth } = require('../middlewares/Auth')
router.get('/', isAuth(), CommandeController.index)
router.get('/:id([0-9]+)', isAuth(), CommandeController.show)
router.get('/:id([0-9]+)', isAuth(), CommandeController.showclient)
router.patch('/:id([0-9]+)/validate', isAuth(2), CommandeController.validate)
router.post('/', isAuth(), isAuth(), CommandeController.create)
router.get('/countCT', CommandeController.countCT)
router.get('/countCV', CommandeController.countCV)
router.patch('/:id([0-9]+)', isAuth(), CommandeController.update)
router.delete('/:id([0-9]+)', isAuth(2), CommandeController.delete)

module.exports = router;
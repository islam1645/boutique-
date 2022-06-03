const router = require('express').Router()
const {AdresseController} = require('../controllers')

router.get('/',AdresseController.index)
router.get('/:id([0-9]+)',AdresseController.show)
router.post('/',AdresseController.create)
router.patch('/:id([0-9]+)',AdresseController.update)
router.delete('/:id([0-9]+)',AdresseController.delete)

module.exports  = router;
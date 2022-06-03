const router = require('express').Router()
const {WilayaController} = require('../controllers')

router.get('/',WilayaController.index)
router.get('/:id([0-9]+)',WilayaController.show)
router.post('/',WilayaController.create)
router.patch('/:id([0-9]+)',WilayaController.update)
router.delete('/:id([0-9]+)',WilayaController.delete)

module.exports  = router;
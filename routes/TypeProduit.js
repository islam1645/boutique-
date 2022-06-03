const router = require('express').Router()
const {TypeProduitController} = require('../controllers')

router.get('/',TypeProduitController.index)
router.get('/:id([0-9]+)',TypeProduitController.show)
router.post('/',TypeProduitController.create)
router.patch('/:id([0-9]+)',TypeProduitController.update)
router.delete('/:id([0-9]+)',TypeProduitController.delete)

module.exports  = router;
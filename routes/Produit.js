const router = require('express').Router()
const { ProduitController } = require('../controllers')
const { isAuth } = require('../middlewares/Auth');
router.get('/', ProduitController.index)
router.get('/:id([0-9]+)', isAuth(), ProduitController.show)
router.get('/count', ProduitController.count)
router.get('/countsavon', ProduitController.countsavon)
router.get('/countLV', ProduitController.countLV)
router.get('/countLM', ProduitController.countLM)
router.get('/countLS', ProduitController.countLS)
router.post('/', isAuth(2), ProduitController.create)
router.patch('/:id([0-9]+)', isAuth(2), ProduitController.update)
router.delete('/:id([0-9]+)', isAuth(2), ProduitController.delete)

module.exports = router;
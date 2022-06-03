const router = require('express').Router()
const {FonctionController} = require('../controllers')
const ParseParams = require("../middlewares/ParseQuery");


router.get('/',ParseParams,FonctionController.index)
router.get('/:id([0-9]+)',FonctionController.show)
router.post('/',FonctionController.create)
router.post('/:id([0-9]+)',FonctionController.update)
router.delete('/:id([0-9]+)',FonctionController.delete)

module.exports  = router;
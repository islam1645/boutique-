const router = require("express").Router();
const { FeedbackController } = require("../controllers");

router.get("/", FeedbackController.index);
router.get("/:id([0-9]+)", FeedbackController.show);
router.post("/", FeedbackController.create);
router.patch("/:id([0-9]+)", FeedbackController.update);
router.delete("/:id([0-9]+)", FeedbackController.delete);

module.exports = router;

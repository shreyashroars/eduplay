const express = require("express");
const router = express.Router();

const {
  getSchedule,
  createSchedule,
} = require("../controller/scheduleController");
const { isLoggedIn } = require("../middleware/userMiddleware");

router.route("/get/schedule").get(isLoggedIn, getSchedule);
router.route("/create/schedule").post(isLoggedIn, createSchedule);

module.exports = router;

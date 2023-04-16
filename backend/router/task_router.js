const express = require("express");
const router = express.Router();

const {
  createTask,
  getAllTasks,
  deleteTask,
} = require("../controller/taskController");
const { isLoggedIn } = require("../middleware/userMiddleware");

router.route("/create/task").post(isLoggedIn, createTask);
router.route("/all/task").get(isLoggedIn, getAllTasks);
router.route("/:taskId/task").delete(isLoggedIn, deleteTask);

module.exports = router;

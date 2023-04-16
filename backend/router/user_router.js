const express = require("express");
const router = express.Router();

const {
  signin,
  getAllUser,
  getUser,
  updateUser,
  createUser,
  searchUser,
  addFriend,
  getFriends,
} = require("../controller/userController");
const { isLoggedIn } = require("../middleware/userMiddleware");

router.route("/create/user").post(createUser);
router.route("/signin/user").post(signin);
router.route("/get/user").get(isLoggedIn, getUser);
router.route("/all/user").get(getAllUser);
router.route("/update/user").patch(isLoggedIn, updateUser);
router.route("/search/user").post(searchUser);
router.route("/add/friend").post(isLoggedIn, addFriend);
router.route("/get/friends").get(isLoggedIn, getFriends);

module.exports = router;

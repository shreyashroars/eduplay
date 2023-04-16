const express = require("express");
const router = express.Router();

const {
  createCommunityPost,
  updateLikes,
  getAllcommunityPost,
} = require("../controller/communityController");
const { isLoggedIn } = require("../middleware/userMiddleware");

router.route("/create/communityPost").post(isLoggedIn, createCommunityPost);
router.route("/:postId/likes").post(updateLikes);
router.route("/getAll/communityPost").get(getAllcommunityPost);

module.exports = router;

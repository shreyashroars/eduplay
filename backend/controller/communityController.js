const BigPromise = require("../middleware/bigPromise");
const Community = require("../modals/community_modal");
const User = require("../modals/user_modal");
const taskModal = require("../modals/task");

exports.createCommunityPost = BigPromise(async (req, res, next) => {
  const { title, image } = req.body;

  if (!title) {
    return res.status(401).json({
      status: 401,
      message: "Please provide title",
    });
  }
  const communityPost = await Community.create({
    title,
    image,
    userId: req.user._id,
  });

  if (!communityPost) {
    return res.status(500).json({
      status: 500,
      message: "Internal error, post did not get created",
    });
  }

  return res.status(200).json({
    status: 200,
    message: "Post created successfully",
    communityPost,
  });
});

exports.updateLikes = BigPromise(async (req, res, next) => {
  let { uuid } = req.params.postId;

  const post = await Community.findOne({ uuid });

  post.likes++;

  await post.save();

  return res.status(200).json({
    status: 200,
    message: "Like counts increased",
    post,
  });
});



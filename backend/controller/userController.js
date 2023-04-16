const User = require("../modals/user_modal");
const BigPromise = require("../middleware/bigPromise");
const jwt = require("jsonwebtoken");

exports.getAllUser = BigPromise(async (req, res, next) => {
  let users = await User.find();

  return res.status(200).json({
    status: 200,
    message: "retrieved successfully",
    users,
  });
});

exports.searchUser = BigPromise(async (req, res, next) => {
  let { email } = req.body;
  let user = await User.findOne({ email: email });

  if (user) {
    return res.status(200).json({
      status: 200,
      message: "user found successfully",
      user,
    });
  } else {
    return res.status(404).json({
      status: 404,
      message: "user not found",
    });
  }
});

exports.addFriend = BigPromise(async (req, res, next) => {
  let user = req.user;
  let { id } = req.body;

  for (let objId of user.friends) {
    console.log(objId.toString());
    if (objId.toString() === id.toString()) {
      return res.status(404).json({
        status: 404,
        message: "user already added to friends list",
      });
    }
  }

  user.friends = [...user.friends, id];

  await user.save();

  return res.status(200).json({
    status: 200,
    message: "user added successfully",
  });
});

exports.getFriends = BigPromise(async (req, res, next) => {
  let user = await User.findOne({ userId: req.user.userId }).populate([
    { path: "friends", model: User },
  ]);

  return res.status(200).json({
    status: 200,
    message: "friends fetch successfully",
    friends: user.friends,
  });
});

exports.getUser = BigPromise(async (req, res, next) => {
  let user = req.user;

  if (!user) {
    return res.status(404).json({
      status: 404,
      message: "user not found",
    });
  }

  return res.status(200).json({
    status: 200,
    message: "retrieved successfully",
    user,
  });
});

exports.updateUser = BigPromise(async (req, res, next) => {
  const { name, email, password, zenCoins } = req.body;

  if (!name) {
    return res.status(400).json({
      status: 400,
      message: "Please provide name of the user",
    });
  }

  let user = req.user;

  user = { ...user, name, email, password, zenCoins };

  await user.save();

  return res.status(200).json({
    status: 200,
    message: "user details updated succesfully",
    user,
  });
});

exports.signin = BigPromise(async (req, res, next) => {
  let { email } = req.body;
  const user = await User.findOne({ email: email });

  if (user) {
    console.log(user);
    const token = jwt.sign({ tokenId: user.userId }, process.env.JWT_SECRET);

    console.log(token);

    return res.status(200).json({
      status: 200,
      message: "User fetched successfully",
      user: user,
      token: token,
    });
  }
  if (!user) {
    return res.status(500).json({
      status: 500,
      message: "Internal error, user not found",
    });
  }
});

exports.createUser = BigPromise(async (req, res, next) => {
  let { name, email, password, zenCoins } = req.body;

  const user = await User.create({
    name,
    email,
    password,
    zenCoins,
  });

  if (!user) {
    return res.status(500).json({
      status: 500,
      message: "Internal error, user not created",
    });
  }

  const token = user.getJwtToken();

  return res.status(200).json({
    status: 200,
    message: "User created succesfully",
    user,
    token,
  });
});

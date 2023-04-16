const BigPromise = require("./bigPromise");
const jwt = require("jsonwebtoken");
const User = require("../modals/user_modal");

exports.isLoggedIn = BigPromise(async (req, res, next) => {
  const token = req.header("Authorization").replace("Bearer ", "");

  if (!token) {
    return res.status(401).json({
      status: 401,
      message: "Access denied, No token available, please login first",
    });
  }

  const decode = await jwt.verify(token, process.env.JWT_SECRET);

  if (!decode) {
    return res.status(401).json({
      status: 401,
      message: "Token authorization failed, Access Denied",
    });
  }

  req.user = await User.findOne({ userId: decode.tokenId });

  next();
});

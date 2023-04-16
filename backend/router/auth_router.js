const express = require("express");
const app = express();
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
let userModal = require("../modals/user_modal");

authRouter.route("/signup").post(postSignup);

authRouter.route("/login").post(Login);

function postSignup(req, res) {
  let userData = req.body;
  console.log(userData);
  res.json({
    message: "user has signed up",
    user: userData,
  });
}

async function Login(req, res) {
  try {
    let data = req.body;
    let user = await userModal.findOne({ email: data.email });
    console.log(user);
    if (user) {
      if (user.password == data.password) {
        const token = jwt.sign({ uid: user._id }, "uid");
        return res.json({
          message: "user has logged in",
          userDetail: user,
          token: token,
        });
      } else {
        return res.json({
          message: "wrong credentials",
        });
      }
    } else {
      res.json({
        message: "user not found",
      });
    }
  } catch (e) {
    return res.status(500).json({
      message: e.message,
    });
  }
}

module.exports = authRouter;

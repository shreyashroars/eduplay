const mongoose = require("mongoose");
const shortid = require("shortid");
const jwt = require("jsonwebtoken");
//user schema...

const userSchema = mongoose.Schema({
  userId: {
    type: String,
    required: true,
    unique: true,
    default: shortid.generate,
  },
  name: {
    type: String,
    require: true,
  },
  email: {
    type: String,
    require: true,
    unique: true,
  },
  password: {
    type: String,
    require: true,
    minLength: 3,
  },
  zenCoins: {
    type: Number,
    default: 0,
  },
  sportActivity: {
    type: Number,
    default: 0,
  },
  studyActivity: {
    type: Number,
    default: 0,
  },
  otherActivity: {
    type: Number,
    default: 0,
  },
  friends: [
    {
      type: mongoose.Types.ObjectId,
      unique: true,
    },
  ],
});

userSchema.methods.getJwtToken = function () {
  return jwt.sign({ tokenId: this.userId }, process.env.JWT_SECRET);
};

module.exports = mongoose.model("userModel", userSchema);

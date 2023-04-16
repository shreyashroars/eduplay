let mongoose = require("mongoose");
let shortid = require("shortId");

const communitySchema = new mongoose.Schema({
  likes: {
    type: Number,
    default: 0,
  },
  title: String,
  uuid: {
    type: String,
    default: shortid.generate,
  },
  image: String,
  userId: {
    type: mongoose.Types.ObjectId,
    ref: "User",
  },
});

module.exports = mongoose.model("Community", communitySchema);

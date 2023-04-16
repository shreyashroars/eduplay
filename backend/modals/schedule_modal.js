const mongoose = require("mongoose");
const Task = require("./task");
const shortid = require("shortid");

const scheduleSchema = mongoose.Schema({
  user: {
    //instead of objectId see if can use userId from user
    type: mongoose.Types.ObjectId,
    ref: "User",
  },
  tasks: [
    {
      type: mongoose.Schema.Types.Mixed,
    },
  ],
  hours: {
    type: Number,
    default: 24,
  },
});

const Schedule = mongoose.model("Schedule", scheduleSchema);
module.exports = Schedule;

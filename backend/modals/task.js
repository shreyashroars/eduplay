const mongoose = require("mongoose");
const validator = require("validator");
const shortid = require("shortid");

const taskSchema = mongoose.Schema({
  uid: {
    type: String,
    required: true,
    unique: true,
    default: shortid.generate,
  },
  title: {
    type: String,
    require: ["true", "Provide the task title"],
  },
  description: {
    type: String,
  },
  taskType: {
    type: String,
    default: "static",
    enum: {
      values: ["static", "dynamic"],
      message: "Please select the taskType as static or dynamic only",
    },
  },
  startTime: {
    type: Number, //24hrs format : 1510
  },
  endTime: {
    type: Number,
  },
  duration: {
    type: mongoose.Schema.Types.Number,
  },
  taskTag: {
    type: String,
    default: "flexible",
    enum: {
      values: ["morning", "afternoon", "evening", "flexible"],
      message:
        "Please select the taskType as morning, afternoon, evening or dynamic only",
    },
  },
  userId: {
    type: String,
    required: true,
  },
  attentionTime: {
    type: Number,
    default: 24,
  },
});

module.exports = mongoose.model("Task", taskSchema);

const Task = require("../modals/task");
const { accedingSortAccordingToProps, findDuration } = require("./algorithms");

exports.convertIntoHMS = (time) => {
  if (time[1] === ":") time = "0" + time;

  time = time.substring(0, 5);

  time += ":00";

  let now = new Date();
  let nowDateTime = now.toISOString();
  let nowDate = nowDateTime.split("T")[0];
  time = new Date(nowDate + "T" + time);

  return time;
};

exports.findVoidIntervals = async (
  currentTime,
  staticTasks,
  relaxationTime
) => {
  staticTasks = accedingSortAccordingToProps(staticTasks, "startTime");

  let unUsedIntervals = []; // [[startTime, duration]]
  let lastEndTime = currentTime;
  const len = staticTasks.length;

  for (let i = 0; i < len; i++) {
    let task = staticTasks[i];

    if (task.endTime < 2400) {
      let relaxTask = new Task({
        title: "Take rest",
        description: "Have a break, have a kitkat",
        taskType: "static",
        startTime: task.endTime,
        endTime: Math.min(
          2400,
          Math.min(
            this.findEndTime(task.endTime, relaxationTime),
            i + 1 < len ? staticTasks[i + 1].startTime : 2400
          )
        ),
        duration: relaxationTime,
        userId: task.userId,
      });

      staticTasks.push(relaxTask);
    }
  }

  accedingSortAccordingToProps(staticTasks, "startTime");

  for (let task of staticTasks) {
    if (task.startTime > lastEndTime) {
      unUsedIntervals.push([
        lastEndTime,
        task.startTime,
        findDuration(lastEndTime, task.startTime),
      ]);
    }
    lastEndTime = task.endTime;
  }

  if (unUsedIntervals.length === 0) {
    unUsedIntervals.push([currentTime, 2400, findDuration(currentTime, 2400)]);
  }

  return unUsedIntervals;
};

exports.getCurrentTag = (currentTime) => {
  if (currentTime >= 600 && currentTime <= 1200) {
    return "morning";
  }
  if (currentTime > 1200 && currentTime <= 1700) {
    return "afternoon";
  }
  if (currentTime > 1700 && currentTime <= 2400) {
    return "evening";
  } else {
    return "not in the tag/ night";
  }
};



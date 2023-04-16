const BigPromise = require("../middleware/bigPromise");
const Task = require("../modals/task");
const Schedule = require("../modals/schedule_modal");
const _ = require("lodash");

const {
  findVoidIntervals,
  getCurrentTag,
  findEndTime,
} = require("../helper/taskTime");
const {
  accedingSortAccordingToProps,
  findDuration,
} = require("../helper/algorithms");

// function comp (a, b){
//     return a[2] - b[2] ;
// }

exports.getSchedule = BigPromise(async (req, res, next) => {
  const schedule = await Schedule.find({ user: req.user.id });

  if (!schedule) {
    return res.status(200).json({
      status: 200,
      message: "Schedule not found",
    });
  }

  return res.status(200).json({
    status: 200,
    message: "Schedule retrieved successfully",
    schedule,
  });
});

exports.createSchedule = BigPromise(async (req, res, next) => {
  const userId = req.user.userId;

  const relaxationTime = 0.25; //15 mins
  let totalTimeBusy = 0;

  console.log(req.user.name);
  const tasks = await Task.find({ userId });

  if (!tasks) {
    return res.status(404).json({
      status: 401,
      message: "No tasks found to create schedule",
    });
  }

  const date = new Date();
  const currTime = date.getHours() * 100 + date.getMinutes();

  const futureTasks = tasks.filter((task) => {
    return task.startTime >= currTime || task.taskType === "dynamic";
  });

  let staticTasks = futureTasks.filter((task) => {
    return task.taskType === "static";
  });

  let dynamicTasks = futureTasks.filter((task) => {
    return task.taskType === "dynamic";
  });

  let unUsedIntervals = await findVoidIntervals(
    currTime,
    staticTasks,
    relaxationTime
  );
  const currSuitableTag = getCurrentTag(currTime);

  dynamicTasks = accedingSortAccordingToProps(dynamicTasks, "duration");
  // unUsedIntervals.sort(comp) ;

  let i = 0,
    j = 0;

  let taskSchedule = [];
  let copyTask = dynamicTasks[0];
  let currInterval = unUsedIntervals[0];

  taskSchedule.push(...staticTasks);

  while (i < dynamicTasks.length && j < unUsedIntervals.length) {
    let currTask = copyTask;

    if (currTask.duration <= currInterval[2]) {
      if (totalTimeBusy + currTask.duration <= 1) {
        totalTimeBusy += currTask.duration;

        currTask.startTime = currInterval[0];
        currTask.endTime = findEndTime(currInterval[0], currTask.duration);

        currInterval = [
          currTask.endTime,
          currInterval[1],
          findDuration(currTask.endTime, currInterval[1]),
        ];
      } else {
        totalTimeBusy = 0;

        currTask.startTime = currInterval[0];
        currTask.endTime = findEndTime(currInterval[0], 1 - totalTimeBusy);

        if (currTask.endTime < 2400) {
          let relaxTask = new Task({
            title: "Take rest",
            description: "Have a break, have a kitkat",
            taskType: "static",
            startTime: currTask.endTime,
            endTime: Math.min(
              2400,
              Math.min(
                this.findEndTime(currTask.endTime, relaxationTime),
                currInterval[1]
              )
            ),
            duration: relaxationTime,
            userId: currTask.userId,
          });
          taskSchedule.push(relaxTask);

          currInterval = [
            relaxTask.endTime,
            currInterval[1],
            findDuration(relaxTask.endTime, currInterval[1]),
          ];
        }
      }

      // currTask.startTime = currInterval[0] ;
      // currTask.endTime =  findEndTime(currInterval[0], currTask.duration);

      // console.log(currTask.startTime + " " + currTask.endTime);

      taskSchedule.push(currTask);

      // currInterval = [currTask.endTime, currInterval[1], findDuration(currTask.endTime, currInterval[1])] ;

      i++;
      copyTask = dynamicTasks[i];
    } else {
      // copyTask = currTask[i] ;
      currTask.startTime = currInterval[0];
      currTask.endTime = currInterval[1];
      taskSchedule.push(currTask);

      // console.log(currTask.startTime + " " + currTask.endTime);

      j++;
      currInterval = unUsedIntervals[j];

      copyTask = JSON.parse(JSON.stringify(currTask));

      copyTask.duration =
        currTask.duration - findDuration(currTask.startTime, currTask.endTime);
    }
  }

  accedingSortAccordingToProps(taskSchedule, "startTime");

  // const schedule = await Schedule.create({
  //     user : req.user,
  //     tasks : taskSchedule,
  // })
  console.log(taskSchedule);

  return res.status(200).json({
    status: 200,
    message: "Schedule created successfully",
    taskSchedule,
  });
});

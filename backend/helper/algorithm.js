exports.accedingSortAccordingToProps = (arr, prop) => {
  arr.sort((a, b) => {
    return a[prop] - b[prop];
  });
  return arr;
};

exports.findDuration = (startTime, endTime) => {
  let stHr = parseInt(startTime / 100) + 1;
  let finHr = parseInt(endTime / 100);
  let mins = 60 - (startTime % 100) + (endTime % 100);

  let duration = finHr - stHr + parseFloat((mins / 60).toFixed(2));

  return duration;
};

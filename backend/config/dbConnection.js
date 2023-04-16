const mongoose = require("mongoose");
require("dotenv").config();

const db = process.env.MONGODB_URL;

const connectWithDb = () => {
  mongoose
    .connect(db, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    })
    .then(function (db) {
      console.log("db connected");
    })
    .catch(function (err) {
      console.log(`DB CONNECTION ERROR`);
      console.log(error);
      process.exit(1);
    });
};

module.exports = connectWithDb;

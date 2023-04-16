const app = require("./app");
const connectWithDb = require("./config/dbConnection");

require("dotenv").config();

const PORT = process.env.PORT || 3000;

// connection to DB...
connectWithDb();

app.listen(PORT, () => {
  console.log("server is listening on port ", PORT);
});

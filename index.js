//import packages
const app = require("express");
const session = require("express-session");
const bodyParser = require("body-parser");

//initialize the app as an express app
const app = express();
const router = express.Router();
const { Client } = require("pg");
const bcrypt = require("bcrypt");

//Insiasi koneksi ke database
const db = new Client({
    host: "naufal-sbd.postgres.database.azure.com",
    port: 5432,
    database: "naufal_9",
    user: "naufal_sbd",
    password:
      "r0ZGRJllVnc%V3plCHD9tS0rva!VXTsWJvL4OsUIVLFpCpHKtMp&gubpbwa!gZKbyU*cKoPz24Gh*Ci@fmqa#9pqKP2MMcHtX^YSE8Q5aiVNRgoPWQE*vKFiFhO3%9tp",
    ssl: true,
  });
  

//import packages
const express = require("express");
const session = require("express-session");
const bodyParser = require("body-parser");

//initialize the app as an express app
const app = express();
const router = express.Router();
const { Client } = require("pg");
const bcrypt = require("bcrypt");

//Insiasi koneksi ke database
const db = new Client({
    host: "mraihanazhari-sbd.postgres.database.azure.com",
    port: 5432,
    database: "klenik",
    user: "kel_6",
    password:
        "3#&1j[(mq4SUKWe9HpjXy9hB.H!z[LJ(4HxI|%UX[t&hxcatb*|yto{QzJl;><5vmbkf1c/y[^-?r(x>wB_7V8b4<KelwSn@=]ON4.{thO7=>pJxC#skqv1PMCtXa97v",
    ssl: true,
});

//middleware (session)
app.use(
    session({
        secret: "ini contoh secret",
        saveUninitialized: false,
        resave: false,
    })
);
//body parser
app.use(bodyParser.json());
app.use(
    bodyParser.urlencoded({
        extended: true,
    })
);

app.use("/", router);
app.listen(process.env.PORT || 6969, () => {
    console.log(`App Started on PORT ${process.env.PORT || 6969}`);
});

// asede botol sama loe semua
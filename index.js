//import packages
const express = require("express");
const session = require("express-session");
const bodyParser = require("body-parser");

//initialize the app as an express app
const app = express();
const router = express.Router();
const { Client } = require("pg");
const bcrypt = require("bcrypt");
const { rows } = require("pg/lib/defaults");

//inisiasi fs untuk impor html
var fs = require('fs');
const { response } = require("express");

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
//Router 1: Menampilkan landing page (login/register)
router.get("/", (req, res) => {
    temp = req.session;

    if (temp.role) {
        //jika user terdaftar maka akan masuk ke halaman menu
        return res.redirect("/menu");
    } else {
        fs.readFile('./login.html', null, function (error, data) {
            if (error) {
                res.writeHead(404)
                alert('File tidak ditemukan!')
            } else {
                return res.end(data)
            }
        })

    }
});
router.get("/register", (req, res) => {
    temp = req.session;

    if (temp.role) {
        //jika user terdaftar maka akan masuk ke halaman menu
        return res.redirect("/menu");
    } else {
        fs.readFile('./register.html', null, function (error, data) {
            if (error) {
                res.writeHead(404)
                alert('File tidak ditemukan!')
            } else {
                res.write(data)
            }
        })

    }
});
router.post("/register", (req, res) => {
    temp = req.session;
    temp.username = req.body.username;
    temp.password = req.body.pass;
    temp.role = req.body.role;

    const salt = bcrypt.genSaltSync();
    const hashed_password = bcrypt.hashSync(req.body.pass, salt)
    const query = `INSERT INTO user_web (user,password,role,reg_time) VALUES 
     ('${temp.username}','${hashed_password}','${role}',now());`

    db.query(query, (err, results) => {
        if (err) {
            console.log(err)
            alert('Registrasi gagal')
            return
        }
        res.send('Insert username dan password berhasil')
        console.log('Berhasil memasukkan username dan password')
        alert('Registrasi berhasil')
        res.write(`<html>
      <head>
          <title>Berhasil registrasi</title>
          <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
          <script>
          alert("Berhasil registrasi");
              </script>
      </head>
      `)
    });

    res.end("done");
});
router.get("/menu", (req, res) => {
    temp = req.session;
    if (!temp.role) {
        fs.readFile('./illegal_access.html', null, function (error, data) {
            if (error) {
                res.writeHead(404)
                alert('File tidak ditemukan!')
            } else {
                return res.end(data)
            }
        })
    } else {

        res.end(
            `<!DOCTYPE html>
            <html lang="en">
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <meta http-equiv="X-UA-Compatible" content="ie=edge">
                    <title>Document</title>
                </head>
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                <script>
                    alert('HARAM MENGAKSES INI KARENA ANDA BELUM LOGIN!');
                    
                 </script>
                <body>
                    <h1>Muka anda macam Keeper Of The Light</h1>
            
                </body>
            </html>`
        );

    }
});
//--------------------Kawasan Teritori Azhari muehehehhe ----------------------------------------------------------
router.post('/getjurusan', (req, res) => {
    const query = "SELECT jurusan.jurusan_id as idjur, jurusan.nama as namjur, departemen.nama as nadept FROM jurusan INNER JOIN mewadahi ON (jurusan.jurusan_id = mewadahi.jurusan_id) INNER JOIN departemen ON (mewadahi.departemen_id = departemen.departemen_id);"; // query ambil data
    //mendapatkan data dari database
    db.query(query, (err, results) => {
        if (err) {
            console.log(err)
            return
        }
        res.status(200)
        res.write( // table header
            `<table id=najur>
                <tr>
                    <th>Nama Jurusan</th>
                    <th>Nama Departemen</th>
                    <th>Contoh Kurikulum<th>
                    <th>Prospek Karir<th>
                </tr>`
        )
        for (row of results.rows) { // tampilin isi table
            res.write(
                `
                <tr> 
                <td>${row['namjur']}</td>
                <td>${row['nadept']}</td>
                <!--
                <td><button class="bkur" href = "http://localhost:6969/" id="${row['idjur']}">Kurikulum</button></td>
                <td><button class="bkar" id="${row['idjur']}">Karir</button></td>
                -->
                <td><a href="http://localhost:6969/" id="${row['idjur']}">Kurikulum</a></td>
                <td><button class="bkar" id="${row['idjur']}">Karir</button></td>
                </tr>
                `
            );
        }
        res.end(`</table></body>`)
    });
});

router.get('/ttgjurusan', (req, res) => {
    res.write(`<html>
        <head>
            <title>Klenik</title>
        </head>
        <body style="background-color: #29C5F6; text-align: center;">`);
    res.write( // table header
        `<h1> Tentang Jurusan </h1>
           <table id=najur>
                <tr>
                    <th>Nama Jurusan</th>
                    <th>Nama Departemen</th>
                    <th>Contoh Kurikulum<th>
                    <th>Prospek Karir<th>
                </tr>`
    )
    res.end(`</table></body>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script>
            jQuery(document).ready(function($) {
                $.post('/getjurusan', { }, function(data) {
                    console.log(data);
                    $("#najur").html(data);
                });
            });
            </script>
        </html>`);


});


//-----------------------------------------------------------------------------------------------------------------------------------
db.connect((err) => {
    if (err) {
        console.log(err)
        return
    }
    console.log('Database berhasil terkoneksi')
})

app.use("/", router);
app.listen(process.env.PORT || 6969, () => {
    console.log(`App Started on PORT ${process.env.PORT || 6969}`);
});

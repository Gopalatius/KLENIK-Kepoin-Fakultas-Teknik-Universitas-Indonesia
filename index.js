//import packages
const express = require("express");
const session = require("express-session");
const bodyParser = require("body-parser");

//initialize the app as an express app
const app = express();
const router = express.Router();
const { Client } = require("pg");
const bcrypt = require("bcrypt");
const { rows, connectionString } = require("pg/lib/defaults");

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
    ssl: true
});

// const host = "mraihanazhari-sbd.postgres.database.azure.com"
// const port = 5432
// const database = "klenik"
// const user = "kel_6"
// const password = `3#&1j[(mq4SUKWe9HpjXy9hB.H!z[LJ(4HxI|%UX[t&hxcatb*|yto{QzJl;><5vmbkf1c/y[^-?r(x>wB_7V8b4<KelwSn@=]ON4.{thO7=>pJxC#skqv1PMCtXa97v`
// // const connectionString = `postgresql://${user}:${password}@${host}:@${port}/@${database}?sslmode=verify-full`
// const db = new Client({
//    connectionString : `postgresql://${user}:${password}@${host}:@${port}/@${database}?sslmode=verify-full`
// });

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
var saved_username = null
exports.saved_username = saved_username
//Router 1: Menampilkan landing page (login/register)
router.get("/", (req, res) => {


    if (req.session.authenticated) {
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
router.post("/login", (req, res) => {



    const query = `SELECT * FROM user_reg WHERE username ='${req.body.username}';`

    db.query(query, (err, results) => {
        if (err) {
            console.log(err)
            return
        }
        //
        if (results.rowCount === 0) {
            return res.status(400).end("No Username")
        } else {
            if (bcrypt.compare(req.body.password, results.rows[0]['password'])) {
                req.session.authenticated = true
                req.session.user_id = results.rows[0]['user_id']
                req.session.username = results.rows[0]['username']
                return res.status(200).end("done")
            }
        }

    });


});
router.get("/register", (req, res) => {
    temp = req.session;

    if (req.session.authenticated) {
        //jika user terdaftar maka akan masuk ke halaman menu
        return res.redirect("/menu");
    } else {
        fs.readFile('./register.html', null, function (error, data) {
            if (error) {
                res.writeHead(404)
                alert('File tidak ditemukan!')
            } else {
                return res.end(data)
            }
        })

    }
});
router.post("/register", (req, res) => {
    temp = req.session;
    temp.username = req.body.username;
    temp.password = req.body.password;
    temp.role = req.body.role;

    const hashed_password = bcrypt.hashSync(temp.password, 10)
    const query = `INSERT INTO user_reg (username,password,role,reg_time) VALUES 
     ('${temp.username}','${hashed_password}','${temp.role}',now());`

    db.query(query, (err, results) => {
        if (err) {
            console.log(err)
            return
        }
        console.log('Berhasil memasukkan username dan password')
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
router.post("/logout", (req, res) => {
    req.session.destroy()
    res.write(`<html>
      <head>
          <title>Berhasil registrasi</title>
          <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
          <script>
          alert("Berhasil registrasi");
              </script>
      </head>
      `)

    return res.end("done");
});
router.get("/menu", (req, res) => {
    let file_html
    if (!req.session.authenticated) {
        file_html = './illegal_access.html'
    } else {
        file_html = './menu.html'
    }
    fs.readFile(file_html, null, function (error, data) {
        if (error) {
            res.writeHead(404)
            alert('File tidak ditemukan!')
        } else {
            return res.end(data)
        }
    })

});
//--------------------Kawasan Teritori Azhari muehehehhe ----------------------------------------------------------
router.post('/getjurusan', (req, res) => {
    const query = "SELECT jurusan.jurusan_id as idjur, jurusan.nama as namjur, departemen.nama as nadept FROM jurusan INNER JOIN mewadahi ON (jurusan.jurusan_id = mewadahi.jurusan_id) INNER JOIN departemen ON (mewadahi.departemen_id = departemen.departemen_id);"; // query ambil data
    //mendapatkan data dari database
    //temp = req.session;
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
                    <th>Contoh Kurikulum</th>
                    <th>Prospek Karir</th>
                    <th>Add Wishlist</th>
                </tr>`
        )

        for (row of results.rows) { // tampilin isi table
            res.write(
                `
                <tr> 
                <td>${row['namjur']}</td>
                <td>${row['nadept']}</td>
                <td><a href="http://localhost:6969/ttgjurusan/kurikulum?idjur=${row['idjur']}&namjur=${row['namjur']}" id="${row['idjur']}">Kurikulum</a></td>
                <td><a href="http://localhost:6969/" id="${row['idjur']}">Karir</a></td>
                <td><a href="http://localhost:6969/" id="${row['idjur']}">Add</a></td>
                `
            );
        }
        res.end(`</table></body>`)
    });
});

router.post('/getkurikulum', (req, res) => {
    const query = `SELECT jurusan.jurusan_id as idjur, jurusan.nama as namjur, kurikulum.nama as nakur FROM jurusan INNER JOIN punya_kurikulum ON (jurusan.jurusan_id = punya_kurikulum.jurusan_id) INNER JOIN kurikulum ON (punya_kurikulum.kurikulum_id = kurikulum.kurikulum_id) WHERE (jurusan.jurusan_id = ${req.body.idjur});` // query ambil data
    //mendapatkan data dari database
    //temp = req.session;
    db.query(query, (err, results) => {
        if (err) {
            console.log(err)
            return
        }
        res.status(200)
        res.write( // table header
            `
            <table id=takur>
                <tr>
                    <th>Mata Kuliah</th>
                </tr>`
        )
        for (row of results.rows) { // tampilin isi table
            res.write(
                `
                <tr> 
                <td>${row['nakur']}</td>
                </tr>
                `
            );
        }
        res.end(`</table></body>`)
    });
});

router.get('/ttgjurusan', (req, res) => {
    //temp = req.session;
    res.write(`<html>
        <head>
            <title>Klenik</title>
        </head>
        <body style="background-color: #29C5F6; text-align: center;">`);

    res.write( // table header
        `<h1> Tentang Jurusan </h1>
        <a href="http://localhost:6969/menu">Kembali ke Menu</a>
        <h2> </h2>
           <table id=najur>
                <tr>
                    <th>Nama Jurusan</th>
                    <th>Nama Departemen</th>
                    <th>Contoh Kurikulum</th>
                    <th>Prospek Karir</th>
                    <th>Add Wishlist</th>
                </tr>`
    )

    res.end(`</table></body>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script>
            jQuery(document).ready(function($) {
                var jid;
                $.post('/getjurusan', { }, function(data) {
                    console.log(data);
                    $("#najur").html(data);
                });
                
            });
            </script>
        </html>`);


});

router.get('/ttgjurusan/kurikulum', (req, res) => {
    //temp = req.session;
    id = `${req.query.idjur}`;
    console.log(id);
    res.write(`<html>
    <head>
        <title>Klenik</title>
    </head>
    <body style="background-color: #29C5F6; text-align: center;">`
    );
    res.write( // table header
        `<h1> Kurikulum </h1>
       <h2>${req.query.namjur}</h2>
       <a href="http://localhost:6969/ttgjurusan">Kembali ke Tentang Jurusan</a>
       <table id=takur>
            <tr>
                <th>Mata Kuliah<th>
            </tr>`
    )
    res.end(`</table></body>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script>
        jQuery(document).ready(function($) {
            $.post('/getkurikulum', {idjur: ${id}}, function(data) {
                console.log(data);
                $("#takur").html(data);
            });
        });
        </script>
    </html>`);


});

//--------------------Kawasan Teritori Anjani ----------------------------------------------------------
router.post('/diskusi', (req, res) => {
    const query = "SELECT pertanyaan.pertanyaan_id as idtan, pertanyaan.text as txttanya, jawaban.text as txtjawab FROM pertanyaan INNER JOIN pertanyaan_dari ON (pertanyaan.pertanyaan_id = pertanyaan_dari.pertanyaan_id) INNER JOIN jawaban ON (pertanyaan_dari.jawaban_id = jawaban.jawaban_id);"; // query ambil data
    //mendapatkan data dari database
    temp = req.session;
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
                <td><a href="http://localhost:6969/ttgjurusan/kurikulum?idjur=${row['idjur']}" id="${row['idjur']}">Kurikulum</a></td>
                <td><a href="http://localhost:6969/" id="${row['idjur']}">Karir</a></td>
                `
            );
        }
        res.end(`</table></body>`)
    });
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

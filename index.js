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
        //login / register page
        res.end(
            `<html>
                  <head>
                      <title>Modul 9 - SBD</title>
                  </head>
                  <body style="background-color: F8CB2E; text-align: center;">
                      <h1> Pusat Data GamingNetlab </h1>
                      <h2> Login </h2>
                      Username:
                      <input type="text" id="username" /><br />
                      Password :
                      <input type="password" id="password" /><br />
                      <input type="button" value="Submit" id="submits" />
  
                      <h2> Register </h2>
                      Username:
                      <input type="text" id="usernames" /><br />
                      Password :
                      <input type="password" id="passwords" /><br />
                      <input type="button" value="Submit" id="register" />
                      <h3> Modul 9 SBD </h3>
                  </body>
                  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                  <script>
                      jQuery(document).ready(function($) {
                          var username, pass;
                          $('#submits').click(function() {
                              username = $('#username').val();
                              pass = $('#password').val();
                              
                              $.post('/login', { username: username, pass: pass }, function(data) {
                                  if (data === 'done') {
                                      window.location.href = '/admin';
                                      window.alert('Login Sukses');
                                  }
                                  else if (data === 'fail'){
                                      window.alert('Login Gagal');
                                  }
                              });
                          });
                          $('#register').click(function() {
                              username = $('#usernames').val();
                              pass = $('#passwords').val();
                              
                              $.post('/register', { username: username, pass: pass }, function(data) {
                                  if (data === 'done') {
                                      window.location.href = '/admin';
                                      window.alert('Registrasi Sukses');
                                  }
                              });
                          });
                      });
                  </script>
              </html>`
        );
    }
});

router.get("/menu", (req, res) => {
    temp = req.session;
    if (!temp) {
        alert('HARAM MENGAKSES INI KARENA ANDA BELUM LOGIN!');
        return res.redirect("/");
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
///router 5: melakukan pengambilan data dari database
router.post('/getjurusan', (req, res) => {
    const query = "SELECT nama FROM jurusan"; // query ambil data
    //mendapatkan data dari database
    db.query(query, (err, results) => {
        if(err){
            console.log(err)
            return
        }
        res.status(200)
        res.write( // table header
           `<table id=najur>
                <tr>
                    <th>Nama Jurusan</th>
                </tr>`
        )
        for (row of results.rows) { // tampilin isi table
            res.write(
                `
                <tr> 
                <td>${row['nama']}</td>
                </tr>
                `
            );
        }
        res.end(`</table></body>`)
    });
});

 
// Router 6: merupakan tampilan data ketika login berhasil dilakukan
router.get('/ttgjurusan', (req, res) => {
        res.write(`<html>
        <head>
            <title>Klenik</title>
        </head>
        <body style="background-color: #29C5F6; text-align: center;">`);
        res.write( // table header
           `<table id=najur>
                <tr>
                    <th>Nama Jurusan</th>
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
db.connect((err)=>{
    if(err){
        console.log(err)
        return
    }
    console.log('Database berhasil terkoneksi')
})

app.use("/", router);
app.listen(process.env.PORT || 6969, () => {
    console.log(`App Started on PORT ${process.env.PORT || 6969}`);
});

//import packages
const express = require("express");
const session = require("express-session");
const bodyParser = require("body-parser");

//initialize the app as an express app
const app = express();
const router = express.Router();
const { Client } = require("pg");
const bcrypt = require("bcrypt");
const { rows, connectionString, user } = require("pg/lib/defaults");

//Melakukan minify pada html
const minify = require("html-minifier").minify;
const minify_options = {
	collapseBooleanAttributes: true,
	collapseWhitespace: true,
	decodeEntities: true,
	html5: true,
	minifyCSS: true,
	minifyJS: true,
	removeAttributeQuotes: true,
	removeComments: true,
	removeEmptyAttributes: true,
	removeOptionalTags: true,
	removeRedundantAttributes: true,
	removeScriptTypeAttributes: true,
	removeStyleLinkTypeAttributes: true,
	removeTagWhitespace: true,
	sortAttributes: true,
	sortClassName: true,
	trimCustomFragments: true,
};

//inisiasi fs untuk impor html
var fs = require("fs");
const { response } = require("express");
const { isWindows } = require("nodemon/lib/utils");

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
		secret: `N65hn$W@vS&8?l%3sNpkACTc3ywItV^%8o?X%T3^birD6Cl=DjuS?-QCVkeeNmLRavpv=pKniYG33Lpj9k#+YHfbU4d*9pz5BW7YbEgt#CEWqt3VTo|b=1Y2QDc6rRPG`,
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
let temp;
//Router 1: Menampilkan landing page (login/register)
router.get("/", (req, res) => {
	if (req.session.authenticated) return res.redirect("/menu");
	fs.readFile("html/login.html", null, function (error, data) {
		if (error) return res.status(404).end("fail");
		return res.end(minify(data, minify_options));
	});
});
router.post("/login", (req, res) => {
	const query = `SELECT * FROM user_reg WHERE username ='${req.body.username}';`;
	db.query(query, (err, results) => {
		if (err) return console.log(err);
		if (results.rowCount === 0) return res.status(400).end("No Username");
		if (bcrypt.compare(req.body.password, results.rows[0]["password"])) {
			req.session.authenticated = true;
			req.session.user_id = results.rows[0]["user_id"];
			req.session.username = results.rows[0]["username"];
			return res.status(200).end("done");
		}
	});
});
router.post("/get_username", (req, res) => {
	res.status(200).end(req.session.username);
});
router.post("/logout", (req, res) => {
	req.session.destroy();
	return res.end("done");
});
router.get("/register", (req, res) => {
	if (req.session.authenticated) return res.redirect("/menu");
	fs.readFile("html/register.html", null, function (error, data) {
		if (error) return res.status(404).end("fail");
		return res.end(minify(data, minify_options));
	});
});
router.post("/register", (req, res) => {
	temp = req.session;

	temp.username = req.body.username;
	temp.password = req.body.password;
	temp.role = req.body.role;

	const hashed_password = bcrypt.hashSync(temp.password, 10);
	const query = `INSERT INTO user_reg (username,password,role,reg_time) VALUES 
     ('${temp.username}','${hashed_password}','${temp.role}',now());`;

	db.query(query, (err, results) => {
		if (err) return console.log(err);
		res.write(
			minify(
				`<html>
        <head>
            <title>Berhasil registrasi</title>
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
            <script>
            alert("Berhasil registrasi");
                </script>
        </head>
        `,
				minify_options
			)
		);
	});

	return res.end("done");
});
router.get("/menu", (req, res) => {
	const file_html = req.session.authenticated
		? "html/menu.html"
		: "html/illegal_access.html";

	fs.readFile(file_html, null, (error, data) => {
		if (error) return res.status(404).end("fail");
		return res.end(minify(data, minify_options));
	});
});
router.get("/pejuang_ptn", (req, res) => {
	//temp = req.session;
	const file_html = req.session.authenticated
		? "html/pejuang_ptn.html"
		: "html/illegal_access.html";

	fs.readFile(file_html, null, (error, data) => {
		if (error) return res.status(404).end("fail");
		return res.end(minify(data, minify_options));
	});
});
router.post("/pejuang_ptn", (req, res) => {
	const query = `
    SELECT 
        jurusan.jurusan_id as idjur, 
        departemen.nama as nadept, 
        jurusan.nama as namjur, 
        jurusan.daya_tampung as dapung, 
        jurusan.kuota_snmptn as snmptn, 
        jurusan.kuota_sbmptn as sbmptn, 
        jurusan.kuota_simakui as simakui, 
        jurusan.kuota_ppkb as ppkb, 
        jurusan.kuota_ts as ts 
    FROM 
        jurusan 
        INNER JOIN mewadahi ON (
        jurusan.jurusan_id = mewadahi.jurusan_id
        ) 
        INNER JOIN departemen ON (
        mewadahi.departemen_id = departemen.departemen_id
    );
    `;
	db.query(query, (err, results) => {
		if (err) return console.log(err);

		results.rows.forEach((row) => {
			res.write(
				`
                <tr align="center">
                <td>${row["nadept"]}</td> 
                <td>${row["namjur"]}</td>
                <td>${row["dapung"]}</td>
                <td>${row["snmptn"]}</td>
                <td>${row["sbmptn"]}</td>
                <td>${row["simakui"]}</td>
                <td>${row["ppkb"]}</td>
                <td>${row["ts"]}</td> </tr>
                `
			);
		});

		return res.status(200).end();
		//hehe
	});

	//mendapatkan data dari database
	//temp = req.session;
});
//--------------------Kawasan Teritori Azhari muehehehhe ----------------------------------------------------------
router.post("/getjurusan", (req, res) => {
	id_user = req.session.user_id;
	console.log(id_user);
	const query =
		"SELECT jurusan.jurusan_id as idjur, jurusan.nama as namjur, departemen.nama as nadept FROM jurusan INNER JOIN mewadahi ON (jurusan.jurusan_id = mewadahi.jurusan_id) INNER JOIN departemen ON (mewadahi.departemen_id = departemen.departemen_id);"; // query ambil data
	//mendapatkan data dari database
	//temp = req.session;
	db.query(query, (err, results) => {
		if (err) {
			console.log(err);
			return;
		}
		res.status(200);

		res.write(
			// table header
			`<table id=najur align="center">
                <tr>
                    <th>Nama Departemen</th>
                    <th>Nama Jurusan</th>
                    <th>Contoh Kurikulum</th>
                    <th>Prospek Karir</th>
                    <th>Add Wishlist</th>
                </tr>`
		);

		for (row of results.rows) {
			// tampilin isi table
			res.write(
				`
                <tr align="center">  
                <td>${row["nadept"]}</td>
                <td>${row["namjur"]}</td>
                <td><a href="ttgjurusan/kurikulum?idjur=${row["idjur"]}&namjur=${row["namjur"]}" id="${row["idjur"]}">Kurikulum</a></td>
                <td><a href="ttgjurusan/karir?idjur=${row["idjur"]}&namjur=${row["namjur"]}" id="${row["idjur"]}">Karir</a></td>
                <td><a href="/addwish?user_id=${req.session.user_id}&idjur=${row["idjur"]}">Add</a></td>
                `
			);
		}
		res.write(`</tr>`);
		res.end(`</table></body>`);
	});
});

router.post("/getkurikulum", (req, res) => {
	const query = `SELECT jurusan.jurusan_id as idjur, jurusan.nama as namjur, kurikulum.nama as nakur FROM jurusan INNER JOIN punya_kurikulum ON (jurusan.jurusan_id = punya_kurikulum.jurusan_id) INNER JOIN kurikulum ON (punya_kurikulum.kurikulum_id = kurikulum.kurikulum_id) WHERE (jurusan.jurusan_id = ${req.body.idjur});`; // query ambil data
	//mendapatkan data dari database
	//temp = req.session;
	db.query(query, (err, results) => {
		if (err) {
			console.log(err);
			return;
		}
		res.status(200).write(
			`
            <table id=takur style = "text-align: center">
                <tr>
                    <th style = "text-align: center">Mata Kuliah</th>
                </tr>`
		);
		for (row of results.rows) {
			// tampilin isi table
			res.write(
				`
                <tr> 
                <td>${row["nakur"]}</td>
                </tr>
                `
			);
		}
		res.end(`</table></body>`);
	});
});

router.post("/getkarir", (req, res) => {
	const query = `SELECT jurusan.jurusan_id as idjur, jurusan.nama as namjur, karir.nama as nakar FROM jurusan INNER JOIN berprospek ON (jurusan.jurusan_id = berprospek.jurusan_id) INNER JOIN karir ON (berprospek.karir_id = karir.karir_id) WHERE (jurusan.jurusan_id = ${req.body.idjur});`; // query ambil data
	//mendapatkan data dari database
	//temp = req.session;
	db.query(query, (err, results) => {
		if (err) {
			console.log(err);
			return;
		}
		res.status(200);
		res.write(
			// table header
			`
            <table id=takar>
                <tr>
                    <th>Karir</th>
                </tr>`
		);
		for (row of results.rows) {
			// tampilin isi table
			res.write(
				`
                <tr> 
                <td>${row["nakar"]}</td>
                </tr>
                `
			);
		}
		res.end(`</table></body>`);
	});
});

router.get("/addwish", (req, res) => {
	user_status = req.session.authenticated;
	console.log(user_status);

	if (user_status) {
		const query = `INSERT INTO wishlist(user_id, jurusan_id) VALUES (${req.query.user_id},${req.query.idjur});`; // query ambil data
		//mendapatkan data dari database
		//temp = req.session;

		db.query(query, (err, results) => {
			if (err) {
				console.log(err);
				return;
			}

			res.send();
			id = `${req.query.idjur}`;
			console.log("test");
			console.log(id);
		});
		res.redirect("/ttgjurusan");
	} else {
		fs.readFile("html/illegal_access.html", null, function (error, data) {
			if (error) return res.status(404).end("fail");
			return res.end(minify(data, minify_options));
		});
	}
});

router.get("/ttgjurusan", (req, res) => {
	user_status = req.session.authenticated;
	console.log(user_status);
	if (user_status) {
		res.write(`<html>
            <head>
                <title>Klenik</title>
                <style>
                    table,
                    th,
                    td {
                        border: 1px solid black;
                    }
                </style>
            </head>
            <body style="background-color: #29C5F6;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            -moz-transform: translateX(-50%) translateY(-50%);
            -webkit-transform: translateX(-50%) translateY(-50%);
            transform: translateX(-50%) translateY(-50%);">`);

		res.write(
			// table header
			`<h1> Tentang Jurusan </h1>
            <a href="http://localhost:6969/menu">Kembali ke Menu</a>
            <h2> </h2>
            <table id=najur style="text-align: center">
                    <tr>
                        <th>Nama Jurusan</th>
                        <th>Nama Departemen</th>
                        <th>Contoh Kurikulum</th>
                        <th>Prospek Karir</th>
                        <th>Add Wishlist</th>
                    </tr>`
		);

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
	} else {
		fs.readFile("html/illegal_access.html", null, function (error, data) {
			if (error) return res.status(404).end("fail");
			return res.end(minify(data, minify_options));
		});
	}
});

router.get("/ttgjurusan/kurikulum", (req, res) => {
	user_status = req.session.authenticated;
	id = `${req.query.idjur}`;
	console.log(id);
    console.log(req.query.namjur);
	if (user_status) {
		res.write(`<html>
        <head>
            <title>Klenik</title>
        </head>
        <body style="background-color: #29C5F6; text-align: center;">`);
		res.write(
			// table header
			`<h1> Kurikulum </h1>
        <h2>${req.query.namjur}</h2>
        <a href="http://localhost:6969/ttgjurusan">Kembali ke Tentang Jurusan</a>
        <h3></h3>
        <table id=takur>
                <tr>
                    <th>Mata Kuliah<th>
                </tr>`
		);
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
	} else {
		fs.readFile("html/illegal_access.html", null, function (error, data) {
			if (error) return res.status(404).end("fail");
			return res.end(minify(data, minify_options));
		});
	}
});

router.get("/ttgjurusan/karir", (req, res) => {
	user_status = req.session.authenticated;
	id = `${req.query.idjur}`;
	console.log(id);
	if (user_status) {
		res.write(`<html>
        <head>
            <title>Klenik</title>
        </head>
        <body style="background-color: #29C5F6; text-align: center;">`);
		res.write(
			// table header
			`<h1> Prospek Karir </h1>
        <h2>${req.query.namjur}</h2>
        <a href="http://localhost:6969/ttgjurusan">Kembali ke Tentang Jurusan</a>
        <table id=takar>
                <tr>
                    <th>Karir<th>
                </tr>`
		);
		res.end(`</table></body>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script>
            jQuery(document).ready(function($) {
                $.post('/getkarir', {idjur: ${id}}, function(data) {
                    console.log(data);
                    $("#takar").html(data);
                });
            });
            </script>
        </html>`);
	} else {
		fs.readFile("html/illegal_access.html", null, function (error, data) {
			if (error) return res.status(404).end("fail");
			return res.end(minify(data, minify_options));
		});
	}
});

//----------Page organisasi dan kegiatan AZHARI----------------------------------------------------------------------
router.post("/getkegjur", (req, res) => {
	id_user = req.session.user_id;
	console.log(id_user);
	const query =
		"SELECT jurusan.jurusan_id as idjur, jurusan.nama as namjur, departemen.nama as nadept FROM jurusan INNER JOIN mewadahi ON (jurusan.jurusan_id = mewadahi.jurusan_id) INNER JOIN departemen ON (mewadahi.departemen_id = departemen.departemen_id);"; // query ambil data
	//mendapatkan data dari database
	//temp = req.session;
	db.query(query, (err, results) => {
		if (err) {
			console.log(err);
			return;
		}
		res.status(200);

		res.write(
			// table header
			`<table id=najur align="center">
                <tr>
                    <th>Nama Departemen</th>
                    <th>Nama Jurusan</th>
                    <th>Organisasi</th>
                    <th>Kegiatan</th>
                    <th>Add Wishlist</th>
                </tr>`
		);

		for (row of results.rows) {
			// tampilin isi table
			res.write(
				`
                <tr align="center">  
                <td>${row["nadept"]}</td>
                <td>${row["namjur"]}</td>
                <td><a href="organisasi_kegiatan/organisasi?idjur=${row["idjur"]}&namjur=${row["namjur"]}" id="${row["idjur"]}">Organisasi</a></td>
                <td><a href="organisasi_kegiatan/kegiatan?idjur=${row["idjur"]}&namjur=${row["namjur"]}" id="${row["idjur"]}">Kegiatan</a></td>
                <td><a href="/addwish?user_id=${req.session.user_id}&idjur=${row["idjur"]}">Add</a></td>
                `
			);
		}
		res.write(`</tr>`);
		res.end(`</table></body>`);
	});
});

router.post("/getorganisasi", (req, res) => {
    const query = `SELECT jurusan.jurusan_id as idjur, jurusan.nama as namjur, organisasi.nama as namor FROM jurusan INNER JOIN berisi_organisasi ON (jurusan.jurusan_id = berisi_organisasi.jurusan_id) INNER JOIN organisasi ON (berisi_organisasi.organisasi_id = organisasi.organisasi_id) WHERE (jurusan.jurusan_id = ${req.body.idjur});`; // query ambil data
    //mendapatkan data dari database
    //temp = req.session;
    db.query(query, (err, results) => {
        if (err) {
            console.log(err);
            return;
        }
        res.status(200);
        res.write(
            // table header
            `
            <table id=takor>
                <tr>
                    <th>Karir</th>
                </tr>`
        );
        for (row of results.rows) {
            // tampilin isi table
            res.write(
                `
                <tr> 
                <td>${row["namor"]}</td>
                </tr>
                `
            );
        }
        res.end(`</table></body>`);
    });
});

router.post("/getkegiatan", (req, res) => {
    const query = `SELECT jurusan.jurusan_id as idjur, jurusan.nama as namjur, kegiatan.nama as nakeg FROM jurusan INNER JOIN berkegiatan ON (jurusan.jurusan_id = berkegiatan.jurusan_id) INNER JOIN kegiatan ON (berkegiatan.kegiatan_id = kegiatan.kegiatan_id) WHERE (jurusan.jurusan_id = ${req.body.idjur});`; // query ambil data
    //mendapatkan data dari database
    //temp = req.session;
    db.query(query, (err, results) => {
        if (err) {
            console.log(err);
            return;
        }
        res.status(200);
        res.write(
            // table header
            `
            <table id=takeg>
                <tr>
                    <th>Kegiatan</th>
                </tr>`
        );
        for (row of results.rows) {
            // tampilin isi table
            res.write(
                `
                <tr> 
                <td>${row["nakeg"]}</td>
                </tr>
                `
            );
        }
        res.end(`</table></body>`);
    });
});


router.get("/organisasi_kegiatan", (req, res) => {
	user_status = req.session.authenticated;
	console.log(user_status);
	if (user_status) {
		res.write(`<html>
            <head>
                <title>Klenik</title>
                <style>
                    table,
                    th,
                    td {
                        border: 1px solid black;
                    }
                </style>
            </head>
            <body style="background-color: #29C5F6;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            -moz-transform: translateX(-50%) translateY(-50%);
            -webkit-transform: translateX(-50%) translateY(-50%);
            transform: translateX(-50%) translateY(-50%);">`);

		res.write(
			// table header
			`<h1> Organisasi dan Kegiatan </h1>
            <a href="http://localhost:6969/menu">Kembali ke Menu</a>
            <h2> </h2>
            <table id=nakegor>
                    <tr>
                        <th>Nama Departemen</th>
                        <th>Nama Jurusan</th>
                        <th>Organisasi</th>
                        <th>Kegiatan</th>
                        <th>Add Wishlist</th>
                    </tr>`
		);

		res.end(`</table></body>
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
            <script>
                jQuery(document).ready(function($) {
                    var jid;
                    $.post('/getkegjur', { }, function(data) {
                        console.log(data);
                        $("#nakegor").html(data);
                    });
                    
                });
                </script>
            </html>`);
	} else {
		fs.readFile("html/illegal_access.html", null, function (error, data) {
			if (error) return res.status(404).end("fail");
			return res.end(minify(data, minify_options));
		});
	}
});

router.get("/organisasi_kegiatan/organisasi", (req, res) => {
    user_status = req.session.authenticated;
    id = `${req.query.idjur}`;
    console.log(id);
    if(user_status){
        res.write(`<html>
        <head>
            <title>Klenik</title>
        </head>
        <body style="background-color: #29C5F6; text-align: center;">`);
        res.write(
            // table header
            `<h1> Organisasi </h1>
        <h2>${req.query.namjur}</h2>
        <a href="http://localhost:6969/organisasi_kegiatan">Kembali ke Tentang Jurusan</a>
        <table id=takor>
                <tr>
                    <th>Organisasi<th>
                </tr>`
        );
        res.end(`</table></body>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script>
            jQuery(document).ready(function($) {
                $.post('/getorganisasi', {idjur: ${id}}, function(data) {
                    console.log(data);
                    $("#takor").html(data);
                });
            });
            </script>
        </html>`);
    }
    else{
        fs.readFile("html/illegal_access.html", null, function (error, data) {
            if (error) return res.status(404).end("fail");
            return res.end(minify(data, minify_options));
        });
    }
});

router.get("/organisasi_kegiatan/kegiatan", (req, res) => {
    user_status = req.session.authenticated;
    id = `${req.query.idjur}`;
    console.log(id);
    if(user_status){
        res.write(`<html>
        <head>
            <title>Klenik</title>
        </head>
        <body style="background-color: #29C5F6; text-align: center;">`);
        res.write(
            // table header
            `<h1> Kegiatan </h1>
        <h2>${req.query.namjur}</h2>
        <a href="http://localhost:6969/organisasi_kegiatan">Kembali ke Tentang Jurusan</a>
        <table id=takeg>
                <tr>
                    <th>Kegiatan<th>
                </tr>`
        );
        res.end(`</table></body>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script>
            jQuery(document).ready(function($) {
                $.post('/getkegiatan', {idjur: ${id}}, function(data) {
                    console.log(data);
                    $("#takeg").html(data);
                });
            });
            </script>
        </html>`);
    }
    else{
        fs.readFile("html/illegal_access.html", null, function (error, data) {
            if (error) return res.status(404).end("fail");
            return res.end(minify(data, minify_options));
        });
    }
});

//--------------------Kawasan Teritori Anjani ----------------------------------------------------------
router.get("/diskusi", (req, res) => {
	fs.readFile("html/diskusi.html", null, (err, data) => {
		if (err) return console.log(err);
		return res.status(200).end(minify(data, minify_options));
	});
	// const query =
	//     `SELECT pertanyaan.pertanyaan_id AS idtanya,
	//         pertanyaan.text AS txttanya,
	//         jawaban.text AS txtjawab
	//     FROM pertanyaan
	//         INNER JOIN pertanyaan_dari
	//             ON (pertanyaan.pertanyaan_id = pertanyaan_dari.pertanyaan_id)
	//         INNER JOIN jawaban
	//             ON (pertanyaan_dari.jawaban_id = jawaban.jawaban_id);`; // query ambil data
	// //mendapatkan data dari database
	// temp = req.session;
	// db.query(query, (err, results) => {
	//     if (err) {
	//         console.log(err);
	//         return;
	//     }

	//     res.status(200).write(
	//         // table header
	//         `
	// 		<table id=idtanya>
	//             <tr>
	//                 <th>ID Pertanyaan</th>
	//                 <th>Pertanyaan</th>
	//                 <th>Jawaban<th>
	//             </tr>`
	//     );

	//     results.rows.forEach((row) =>{
	//         res.write(
	//             `
	//             <tr>
	//             <td>${row["idtanya"]}</td>
	//             <td><a href="ttgjurusan/kurikulum?idjur=${row["idjur"]}&namjur=${row["namjur"]}" id="${row["idjur"]}">Kurikulum</a></td>
	//             <td>${row["txtpertanyaan"]}</td>
	//             <td>${row["txtjawab"]}</td>
	//             `
	//         );
	//     })
	//     // for (row of results.rows) {
	//     //     // tampilin isi table

	//     // }
	//     res.end(`</table></body>`);
	// });
});

router.post("/diskusi/tanya", (req, res) => {});

router.get("/wishlist", (req, res) => {});

//-----------------------------------------------------------------------------------------------------------------------------------
db.connect((err) => {
	if (err) return console.log(err);
	console.log("Database berhasil terkoneksi");
});

app.use("/", router);
app.listen(process.env.PORT || 6969, () => {
	console.log(`App Started on PORT ${process.env.PORT || 6969}`);
});

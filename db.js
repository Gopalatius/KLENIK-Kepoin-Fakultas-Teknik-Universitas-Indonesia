const { Client } = require("pg")

const db = new Client({
	host: "mraihanazhari-sbd.postgres.database.azure.com",
	port: 5432,
	database: "klenik",
	user: "kel_6",
	password:
		"3#&1j[(mq4SUKWe9HpjXy9hB.H!z[LJ(4HxI|%UX[t&hxcatb*|yto{QzJl;><5vmbkf1c/y[^-?r(x>wB_7V8b4<KelwSn@=]ON4.{thO7=>pJxC#skqv1PMCtXa97v",
	ssl: true,
})

db.connect((err) => {
	if (err) return console.log(err)
	console.log("Database berhasil terkoneksi")
})

module.exports = {db}

/*
cara dump nya pake di bawah ini

pg_dump --dbname=klenik --host=mraihanazhari-sbd.postgres.database.azure.com --port=5432 --username=kel_6 -W --file=D:\SBD\db.sql
3#&1j[(mq4SUKWe9HpjXy9hB.H!z[LJ(4HxI|%UX[t&hxcatb*|yto{QzJl;><5vmbkf1c/y[^-?r(x>wB_7V8b4<KelwSn@=]ON4.{thO7=>pJxC#skqv1PMCtXa97v

*/
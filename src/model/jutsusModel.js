const db = require("./db");

const findAll = async () => {
	try {
		const [jutsus] = await db.query("select * from jutsus");
		return jutsus;
	} catch (err) {
		console.error(err);
	}
};

const findOne = async (id) => {
	try {
		const [jutsu] = await db.query("select * from jutsus where id = ?", [id]);
		return jutsu;
	} catch (err) {
		console.error(err);
	}
};

module.exports = { findAll, findOne };

const db = require("./db");

const findAll = async () => {
	try {
		const [villages] = await db.query("select * from villages");
		return villages;
	} catch (err) {
		console.error(err);
	}
};

const findOne = async (id) => {
	try {
		const [village] = await db.query("select * from villages where id = ?", [
			id,
		]);
		return village;
	} catch (err) {
		console.error(err);
	}
};

module.exports = { findAll, findOne };

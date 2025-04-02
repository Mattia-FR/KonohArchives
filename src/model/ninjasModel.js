const db = require("./db");

const findAll = async () => {
	try {
		const [ninjas] = await db.query("select * from ninjas");
		return ninjas;
	} catch (err) {
		console.error(err);
	}
};

const findOne = async (id) => {
	try {
		const [ninja] = await db.query("select * from ninjas where id = ?", [id]);
		return ninja;
	} catch (err) {
		console.error(err);
	}
};

module.exports = { findAll, findOne };

const db = require("./db");

const findAll = async () => {
	try {
		const [missions] = await db.query("select * from missions");
		return missions;
	} catch (err) {
		console.error(err);
	}
};

const findOne = async (id) => {
	try {
		const [mission] = await db.query("select * from missions where id = ?", [
			id,
		]);
		return mission;
	} catch (err) {
		console.error(err);
	}
};

module.exports = { findAll, findOne };

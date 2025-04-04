const db = require("./db");

const findAll = async () => {
	try {
		const [ninjas] = await db.query("select * from ninjas");
		return ninjas;
	} catch (err) {
		console.error(err);
	}
};

// const findOne = async (id) => {
// 	try {
// 		const [ninja] = await db.query(
// 			"SELECT n.*, v.name AS village_name FROM ninjas n LEFT JOIN villages v ON n.village_id = v.id WHERE n.id = ?",
// 			[id],
// 		);
// 		return ninja[0];
// 	} catch (err) {
// 		console.error(err);
// 	}
// };

const findOne = async (id) => {
	try {
		const [ninjaRows] = await db.query(
			"SELECT n.*, v.name AS village_name FROM ninjas n LEFT JOIN villages v ON n.village_id = v.id WHERE n.id = ?",
			[id],
		);
		const ninja = ninjaRows[0];
		if (!ninja) return null;

		const [jutsus] = await db.query(
			"SELECT j.* FROM jutsus j JOIN ninja_jutsus nj ON j.id = nj.jutsu_id WHERE nj.ninja_id = ?",
			[id],
		);
		ninja.jutsus = jutsus;

		return ninja;
	} catch (err) {
		console.error(err);
	}
};

const updateOne = async (
	id,
	{
		name,
		age = null,
		clan = null,
		rank = null,
		description = null,
		village_id,
		gender = null,
	},
) => {
	try {
		const [result] = await db.query(
			"UPDATE ninjas SET name = ?, age = ?, clan = ?, `rank` = ?, description = ?, village_id = ?, gender = ? WHERE id = ?",
			[name, age, clan, rank, description, village_id, gender, id],
		);

		return result;
	} catch (err) {
		console.error(err);
	}
};

const insertOne = async ({
	name,
	age = null,
	clan = null,
	rank = null,
	description = null,
	village_id,
	gender = null,
}) => {
	try {
		const [result] = await db.query(
			"INSERT INTO ninjas (name, age, clan, `rank`, description, village_id, gender) VALUES (?, ?, ?, ?, ?, ?, ?)",
			[name, age, clan, rank, description, village_id, gender],
		);

		return result;
	} catch (err) {
		console.error(err);
	}
};

const deleteOne = async (id) => {
	try {
		const [result] = await db.query("DELETE FROM ninjas WHERE id = ?", [id]);
		return result;
	} catch (err) {
		console.error(err);
	}
};

module.exports = { findAll, findOne, updateOne, insertOne, deleteOne };

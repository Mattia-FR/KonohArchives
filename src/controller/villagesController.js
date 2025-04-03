const { findAll, findOne } = require("../model/villagesModel");

const browse = async (req, res) => {
	try {
		const villages = await findAll();
		res.status(200).json(villages);
	} catch (err) {
		console.error(err);
		res.sendStatus(500);
	}
};

const read = async (req, res) => {
	try {
		const villageId = Number.parseInt(req.params.id, 10);
		if (Number.isNaN(villageId)) {
			return res.status(400).json({ error: "Invalid ID" });
		}

		const village = await findOne(villageId);
		res.status(200).json(village);
	} catch (err) {
		console.error(err);
		res.sendStatus(500);
	}
};

module.exports = { browse, read };

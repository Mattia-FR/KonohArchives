const { findAll, findOne } = require("../model/ninjasModel");

const browse = async (req, res) => {
	try {
		const villages = await findAll();
		res.status(200).json(villages);
	} catch (err) {
		res.sendStatus(500);
	}
};

const read = async (req, res) => {
	try {
		if (Number.isNaN(req.params.id)) {
			return res.status(400).json({ error: "Invalid ID" });
		}
		const villageId = Number.parseInt(req.params.id, 10);
		const village = await findOne(villageId);
		res.status(200).json(village);
	} catch (err) {
		res.sendStatus(500);
	}
};

module.exports = { browse, read };

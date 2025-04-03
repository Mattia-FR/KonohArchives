const { findAll, findOne } = require("../model/jutsusModel");

const browse = async (req, res) => {
	try {
		const jutsus = await findAll();
		res.status(200).json(jutsus);
	} catch (err) {
		res.sendStatus(500);
	}
};

const read = async (req, res) => {
	try {
		if (Number.isNaN(req.params.id)) {
			return res.status(400).json({ error: "Invalid ID" });
		}
		const jutsuId = Number.parseInt(req.params.id, 10);
		const jutsu = await findOne(jutsuId);
		res.status(200).json(jutsu);
	} catch (err) {
		res.sendStatus(500);
	}
};

module.exports = { browse, read };

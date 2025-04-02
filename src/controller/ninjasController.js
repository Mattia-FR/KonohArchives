const { findAll, findOne } = require("../model/ninjasModel");

const browse = async (req, res) => {
	try {
		const ninjas = await findAll();
		res.status(200).json(ninjas);
	} catch (err) {
		res.sendStatus(500);
	}
};

const read = async (req, res) => {
	try {
		if (Number.isNaN(req.params.id)) {
			return res.status(400).json({ error: "Invalid ID" });
		}
		const ninjaId = Number.parseInt(req.params.id, 10);
		const ninja = await findOne(ninjaId);
		res.status(200).json(ninja);
	} catch (err) {
		res.sendStatus(500);
	}
};

module.exports = { browse, read };

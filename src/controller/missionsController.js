const { findAll, findOne } = require("../model/ninjasModel");

const browse = async (req, res) => {
	try {
		const missions = await findAll();
		res.status(200).json(missions);
	} catch (err) {
		res.sendStatus(500);
	}
};

const read = async (req, res) => {
	try {
		if (Number.isNaN(req.params.id)) {
			return res.status(400).json({ error: "Invalid ID" });
		}
		const missionId = Number.parseInt(req.params.id, 10);
		const mission = await findOne(missionId);
		res.status(200).json(mission);
	} catch (err) {
		res.sendStatus(500);
	}
};

module.exports = { browse, read };

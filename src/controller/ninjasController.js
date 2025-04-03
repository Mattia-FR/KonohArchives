const { findAll, findOne, insertOne } = require("../model/ninjasModel");

const browse = async (req, res) => {
	try {
		const ninjas = await findAll();
		res.status(200).json(ninjas);
	} catch (err) {
		console.error(err);
		res.sendStatus(500);
	}
};

const read = async (req, res) => {
	try {
		const ninjaId = Number.parseInt(req.params.id, 10);
		if (Number.isNaN(ninjaId)) {
			return res.status(400).json({ error: "Invalid ID" });
		}

		const ninja = await findOne(ninjaId);
		res.status(200).json(ninja);
	} catch (err) {
		console.error(err);
		res.sendStatus(500);
	}
};

const edit = async (req, res) => {
	try {
		const ninjaId = Number.parseInt(req.params.id, 10);
		if (Number.isNaN(ninjaId)) {
			return res.status(400).json({ error: "Invalid ID" });
		}

		const updated = await updateOne(ninjaId, { ...req.body });

		if (!updated?.affectedRows) {
			return res.sendStatus(404);
		}

		res.sendStatus(204);
	} catch (err) {
		console.error(err);
		res.sendStatus(500);
	}
};

const add = async (req, res) => {
	try {
		const result = await insertOne({ ...req.body });

		if (!result?.insertId) {
			return res.sendStatus(500);
		}

		res.status(201).json({ id: result.insertId });
	} catch (err) {
		console.error(err);

		if (err.message === "Missing required fields") {
			return res.status(400).json({ error: err.message });
		}

		res.sendStatus(500);
	}
};

const destroy = async (req, res) => {
	try {
		const ninjaId = Number.parseInt(req.params.id, 10);
		if (Number.isNaN(ninjaId)) {
			return res.status(400).json({ error: "Invalid ID" });
		}

		const result = await deleteOne(ninjaId);

		if (!result?.affectedRows) {
			return res.sendStatus(404);
		}

		res.sendStatus(204);
	} catch (err) {
		console.error(err);
		res.sendStatus(500);
	}
};

module.exports = { browse, read, edit, add, destroy };

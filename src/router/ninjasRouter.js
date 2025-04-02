const express = require("express");
const db = require("../model/db");

const router = express.Router();

// get http://localhost:4242/api/ninjas/
router.get("/", async (req, res) => {
	const [ninjas] = await db.query("select * from ninjas");
	res.json(ninjas);
});

module.exports = router;

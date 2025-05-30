const express = require("express");
const db = require("../model/db");

const router = express.Router();

const {
	browse,
	read,
	edit,
	add,
	destroy,
} = require("../controller/ninjasController");

// get http://localhost:4242/api/ninjas/
router.get("/", browse);
router.get("/:id", read);
router.put("/:id", edit);
router.post("/", add);
router.delete("/:id", destroy);

module.exports = router;

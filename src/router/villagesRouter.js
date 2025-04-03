const express = require("express");
const db = require("../model/db");

const router = express.Router();

const { browse, read } = require("../controller/villagesController");

router.get("/", browse);
router.get("/:id", read);

module.exports = router;

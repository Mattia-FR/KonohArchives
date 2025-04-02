const express = require("express");
const db = require("../model/db");

const router = express.Router();

const { browse, read } = require("../controller/ninjasController");

// get http://localhost:4242/api/ninjas/
router.get("/", browse);
router.get("/:id", read);

module.exports = router;

const express = require("express");

const router = express.Router();

// get http://localhost:4242/api/ninjas/
router.get("/", (req, res) => {
	console.log("Je suis sur la route /api/ninjas/");
});

module.exports = router;

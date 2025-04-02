const express = require("express");
const router = express.Router();

const ninjasRouter = require("./ninjasRouter");
router.use("/ninjas", ninjasRouter);

module.exports = router;

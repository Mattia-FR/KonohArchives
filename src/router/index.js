const express = require("express");
const router = express.Router();

const ninjasRouter = require("./ninjasRouter");
router.use("/ninjas", ninjasRouter);

// const villagesRouter = require("./villagesRouter");
// router.use("/villages", villagesRouter);

// const jutsusRouter = require("./jutsusRouter");
// router.use("/jutsus", jutsusRouter);

// const missionsRouter = require("./missionsRouter");
// router.use("/missions", missionsRouter);

module.exports = router;

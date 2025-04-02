const express = require("express");
const router = require("./router");
const app = express();

// get http://localhost:4242
app.get("/", (req, res) => {
	res.status(200).send("Je suis sur l'API http://localhost:4242/");
});

app.use("/api", router);

module.exports = app;

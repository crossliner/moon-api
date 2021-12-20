const PORT = 1984;

const moonscript = require("./moonscript");
const express = require("express");
const app = express();

app.use(express.text());

app.post("/compile", (req, res) => {
  res.end(moonscript.compile(req.body));
});

app.listen(PORT);

const moonscript = require("./moonscript");

function compile(code) {
  return moonscript.ccall("compile_moonscript", "string", [ "string" ], [ code ]);
};

module.exports = {
  compile
};
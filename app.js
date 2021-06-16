const nearley = require("nearley");
const grammar = require("./grammar.js");

// Create a Parser object from our grammar.
const parser = new nearley.Parser(nearley.Grammar.fromCompiled(grammar));

parser.feed(` [ "a" , 1,null, [1,2]]`);

console.log(parser.results[0]);
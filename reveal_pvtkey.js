var keythereum = require("keythereum");
var datadir = "/home/eps106-epixel/Documents/GerardClique/node2/data";
var address= "0x15c9e5f83a0d3152cc2a7ea663cc52b875f2eaf6";
const password = "123";

var keyObject = keythereum.importFromFile(address, datadir);
var privateKey = keythereum.recover(password, keyObject);
console.log(privateKey.toString('hex'));
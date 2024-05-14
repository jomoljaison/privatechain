#!/bin/bash

geth --datadir "./data" \
     --port 30310 \
     --bootnodes "enode://bdc85a2896debbe3a27f8b4a3ac61fc9aa5f021423ea50cc5a89cd2b21a8bbbe1859b706d2ac255fb11c91bbf6b8ee2e790465236c6960c3e56b2e3bed94ba0d@127.0.0.1:30301" \
     --authrpc.port 8008 \
     --networkid 9006 \
     --http.port 8007 \
     --http.addr 127.0.0.1 \
     --http.api eth,net,web3,personal,debug,admin,miner,net,txpool \
     --unlock 0xb798c05826ba4dd088cf39cfc04fb34d801131cc \
     --password /home/eps106-epixel/Documents/GerardClique/nodes/pass.txt
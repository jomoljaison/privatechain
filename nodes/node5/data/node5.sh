#!/bin/bash

geth --datadir "./data" \
     --port 30312 \
     --bootnodes "enode://bdc85a2896debbe3a27f8b4a3ac61fc9aa5f021423ea50cc5a89cd2b21a8bbbe1859b706d2ac255fb11c91bbf6b8ee2e790465236c6960c3e56b2e3bed94ba0d@127.0.0.1:30301" \
     --authrpc.port 8010 \
     --networkid 9006 \
     --http.port 8009 \
     --http.addr 127.0.0.1 \
     --http.api eth,net,web3,personal,debug,admin,miner,net,txpool \
     --unlock 0x7759356b237d04e68e30de4688645c9be5d16817 \
     --password /home/eps106-epixel/Documents/GerardClique/nodes/pass.txt
#!/bin/bash

     geth --datadir "./data" \
    --port 30308 \
    --bootnodes "enode://6f4d3932c2af7b9f85506df0a9233f4de23a067c2715f0466e0f1289f13f17516239e28a3e85ba258c876de4d75b632cb9edf70b08804de48b99b07412d5c6fb@127.0.0.1:30302" \
    --authrpc.port 8006 \
    --networkid 9006 \
    --http.port 8005 \
    --http.addr=0.0.0.0 \
    --http.api "eth,net,web3,personal,debug,admin,net,txpool" \
    --unlock  0x2affb74ea87dfdbc41cf0b8b159b34b863bbff92 \
    --password "/home/gd-ethereum-node-test-user/privatechain/nodes/pass.txt"

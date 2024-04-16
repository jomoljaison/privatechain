


## install geth 
>sudo tar -xvf geth-linux-amd64-1.13.14-2bd6bd01.tar.gz
>cd geth-linux-amd64-1.13.14-2bd6bd01
>sudo chmod +X geth
>sudo cp geth /usr/local/bin/    
>geth version  
    Geth
    Version: 1.13.14-stable
    Git Commit: 2bd6bd01d2e8561dd7fc21b631f4a34ac16627a1
    Git Commit Date: 20240227
    Architecture: amd64
    Go Version: go1.21.6
    Operating System: linux
    GOPATH=
    GOROOT=



## create folder GerardClique
## create two nodes(two signers)
>mkdir node1 node2
## create account for node1(IMPORT ACCOUNT USING PVT KEYS)


geth account import --datadir /home/eps106-epixel/Documents/GerardClique/node1 ./acc1.prv

geth account import --datadir /home/eps106-epixel/Documents/GerardClique/node2 ./acc2.prv
                        or
geth --datadir "./data" account new



in address folder

0xd0ce71Fcc4108A4dE2C226C6593ea10A45180c60
0xFfA3cF6a5Cd08Aa65a277F485214330beFCB2ED0
0x03e2fAcED7B51CBAF8eDaa35d5192cE570eCb962

0x2afFb74eA87dfdBC41cf0B8b159B34B863BbFF92
0x1672184bB781Bca37e51BAf17D03e5d18a2A4eE1

node1 0x355d2de986b43bfc9251339e758d0eb15ce8ae05
node2 0x15c9e5F83a0d3152cC2a7EA663CC52B875F2eaf6
password =  123



## create genesis file (clique)
store  chainid,gas diffculty,block time ,consensus algorithm

{
    "config": {
      "chainId": 9006,
      "homesteadBlock": 0,
      "eip150Block": 0,
      "eip155Block": 0,
      "eip158Block": 0,
      "byzantiumBlock": 0,
      "constantinopleBlock": 0,
      "petersburgBlock": 0,
      "istanbulBlock": 0,
      "berlinBlock": 0,
      "clique": {
        "period": 2,
        "epoch": 30000
      }
    },
    "difficulty": "1",
    "gasLimit": "8000000",
    "extradata": "0x000000000000000000000000000000000000000000000000000000000000000003e2faced7b51cbaf8edaa35d5192ce570ecb96215c9e5f83a0d3152cc2a7ea663cc52b875f2eaf6355d2de986b43bfc9251339e758d0eb15ce8ae05d0ce71fcc4108a4de2c226c6593ea10a45180c60ffa3cf6a5cd08aa65a277f485214330befcb2ed00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    "alloc": {
      "0000000000000000000000000000000000000000": {
        "balance": "0x0"
      },
      "0000000000000000000000000000000000000001": {
        "balance": "0x0"
      },
      "15c9e5f83a0d3152cc2a7ea663cc52b875f2eaf6": {
        "balance": "0x1b1ae4d6e2ef500000"
      },
      "355d2de986b43bfc9251339e758d0eb15ce8ae05": {
        "balance": "0x1b1ae4d6e2ef500000"
      }
    }
  }





  ## configure genesis file with node1 and node2
  >cd node1
  > geth --datadir ./data init /home/eps106-epixel/Documents/GerardClique/privateblock.json
  >cd node2
  > geth --datadir ./data init /home/eps106-epixel/Documents/GerardClique/privateblock.json


  ## bootnode
  for connecting nodes ,is called entry node
  
  generate bootnode
  > bootnode -genkey bootnode.key
  (created bootnode key)
  execute bootnode
  > bootnode -nodekey bootnode.key -verbosity 7 -addr "0.0.0.0:30301"
enode://b918fcc896e835b62d35b09bd851eb7ad9ad1af787e230cc4338d0721cd9ac04f90ad0af116fd528c563f8f2d17a3fc01b4ea1190d388075dce52f986152c5e4@127.0.0.1:0?discport=30301

/home/eps106-epixel/Documents/GerardClique/node1/pass.txt
## start node1

 geth --datadir "./data"  --port 30304 --bootnodes enode://b918fcc896e835b62d35b09bd851eb7ad9ad1af787e230cc4338d0721cd9ac04f90ad0af116fd528c563f8f2d17a3fc01b4ea1190d388075dce52f986152c5e4@127.0.0.1:30301 --authrpc.port 8002 --ipcdisable --allow-insecure-unlock --http --http.port 8001 --http.corsdomain="*" --http.addr=0.0.0.0 --http.api eth,net,web3,personal,debug,admin,miner,net,txpool --networkid 9006 --unlock 355d2de986b43bfc9251339e758d0eb15ce8ae05 --identity "NODE1" --password /home/eps106-epixel/Documents/GerardClique/node1/pass.txt  --mine --miner.etherbase=0x355d2de986b43bfc9251339e758d0eb15ce8ae05

## start node2
geth --datadir "./data"  --port 30306 --bootnodes enode://b918fcc896e835b62d35b09bd851eb7ad9ad1af787e230cc4338d0721cd9ac04f90ad0af116fd528c563f8f2d17a3fc01b4ea1190d388075dce52f986152c5e4@127.0.0.1:30301  --authrpc.port 8004 --networkid 9006 --http.port 8003 --http.addr=0.0.0.0 --http.api eth,net,web3,personal,debug,admin,miner,net,txpool  --unlock 0x15c9e5F83a0d3152cC2a7EA663CC52B875F2eaf6 --password /home/eps106-epixel/Documents/GerardClique/node2/pass.txt






-http.api debug,eth,web3,personal,net,admin.

node1 self=enode://e1baf3567f3dcd8a43302df4b810abb89b3872e692dc0c29f38c9aa2df900b5ad78eb4a52c21d652243adc5c0c961b0ce0bcb0dd013a1f47470537a4687ac233@127.0.0.1:30304

node2 self=eenode://79b266ac49226b1074aea1a53fe7c72cf7c5511c2224401c7748861ed85a7fb2c032dd46ef1f4488b082cc790515d99b01b97df2141fcb09e61aa161e82e2e75@127.0.0.1:30306

admin.addPeer('enode://79b266ac49226b1074aea1a53fe7c72cf7c5511c2224401c7748861ed85a7fb2c032dd46ef1f4488b082cc790515d99b01b97df2141fcb09e61aa161e82e2e75@127.0.0.1:30306');
admin.addPeer('enode://e1baf3567f3dcd8a43302df4b810abb89b3872e692dc0c29f38c9aa2df900b5ad78eb4a52c21d652243adc5c0c961b0ce0bcb0dd013a1f47470537a4687ac233@127.0.0.1:30304');


remix evm :evm version: byzantium
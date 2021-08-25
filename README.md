#Sinc 2020.12.02 
#ezzcs

start work

1 install  brownie

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get install build-essential python-dev python-setuptools python-pip python-smbus
sudo apt-get install build-essential libncursesw5-dev libgdbm-dev libc6-dev
sudo apt-get install zlib1g-dev libsqlite3-dev tk-dev
sudo apt-get install libssl-dev openssl
sudo apt-get install libffi-dev

tar -xvzf Python-3.8.4.tgz
cd Python-3.8.4
./configure
make
make install

pip3 install eth-brownie

2 update test case.
2021.02.19
2021.02.20

3 truffle compile
 error duplicate
 remove files in build

4 test libp2p form rust.
  test it for the future comunication

4 test libp2p form rust.
  test it for the future comunication.


5 coinbase lanched today. 

6 test libp2p from go.
2021.04.29

7 install nfs

sudo apt-get install nfs-kernel-server  # 安装 NFS服务器端

sudo apt-get install nfs-common         # 安装 NFS客户端

sudo vim /etc/exports
/nfsroot *(rw,sync,no_root_squash)

sudo mkdir /nfsroot
sudo chmod -R 777 /nfsroot
sudo chown ipual:ipual /nfsroot/ -R  


sudo /etc/init.d/nfs-kernel-server start    或者  
sudo /etc/init.d/nfs-kernel-server restart

sudo mount -t nfs 192.168.12.123:/nfsroot /mnt -o nolock

nfs port:

tcp 111 2049 端口

udp 111 4046 端口

8 add dns
/etc/resolv.conf
nameserver 8.8.8.8
nameserver 8.8.4.4

9 go env
export GOPROXY=https://goproxy.cn

10 install ethereum

$ sudo apt update
$ sudo apt install software-properties-common

sudo add-apt-repository -y ppa:ethereum/ethereuma

apt update

sudo apt-get update
sudo apt-get install ethereum
Or the develop version via:

sudo apt-get update
sudo apt-get install ethereum-unstable
The abigen, bootnode, clef, evm, geth, puppeth, rlpdump, and wnode commands are then available on your system in /usr/bin/.

11 ethereum cmd

miner.setEtherbase(ac1)
miner.start(10)
eth.mining

nohup geth --datadir="/data/gethdata" --rpc --rpcaddr=0.0.0.0 --rpcport=8545 --cache=512 --maxpeers 9999 --rpcapi=“web3,eth,net,personal,db,admin” --rpccorsdomain="*" > ./geth.log &2>1

geth attach ipc:/data/gethdata/geth.ipc

11 ethereum cmd

miner.setEtherbase(ac1)
miner.start(10)
eth.mining

nohup geth --datadir="/data/gethdata" --rpc --rpcaddr=0.0.0.0 --rpcport=8545 --cache=512 --maxpeers 9999 --rpcapi=“web3,eth,net,personal,db,admin” --rpccorsdomain="*" > ./geth.log &2>1

geth attach ipc:/data/gethdata/geth.ipc

11 ethereum cmd

miner.setEtherbase(ac1)
miner.start(10)
eth.mining

nohup geth --datadir="/data/gethdata" --rpc --rpcaddr=0.0.0.0 --rpcport=8545 --cache=512 --maxpeers 9999 --rpcapi=“web3,eth,net,personal,db,admin” --rpccorsdomain="*" > ./geth.log &2>1

geth attach ipc:/data/gethdata/geth.ipc

11 ethereum cmd

miner.setEtherbase(ac1)
miner.start(10)
eth.mining

nohup geth --datadir="/data/gethdata" --rpc --rpcaddr=0.0.0.0 --rpcport=8545 --cache=512 --maxpeers 9999 --rpcapi=“web3,eth,net,personal,db,admin” --rpccorsdomain="*" > ./geth.log &2>1

geth attach ipc:/data/gethdata/geth.ipc

11 ethereum cmd

miner.setEtherbase(ac1)
miner.start(10)
eth.mining

nohup geth --datadir="/data/gethdata" --rpc --rpcaddr=0.0.0.0 --rpcport=8545 --cache=512 --maxpeers 9999 --rpcapi=“web3,eth,net,personal,db,admin” --rpccorsdomain="*" > ./geth.log &2>1

geth attach ipc:/data/gethdata/geth.ipc

11 ethereum cmd

miner.setEtherbase(ac1)
miner.start(10)
eth.mining

nohup geth --datadir="/data/gethdata" --rpc --rpcaddr=0.0.0.0 --rpcport=8545 --cache=512 --maxpeers 9999 --rpcapi=“web3,eth,net,personal,db,admin” --rpccorsdomain="*" > ./geth.log &2>1

geth attach ipc:/data/gethdata/geth.ipc

11 ethereum cmd

miner.setEtherbase(ac1)
miner.start(10)
eth.mining

nohup geth --datadir="/data/gethdata" --rpc --rpcaddr=0.0.0.0 --rpcport=8545 --cache=512 --maxpeers 9999 --rpcapi=“web3,eth,net,personal,db,admin” --rpccorsdomain="*" > ./geth.log &2>1

geth attach ipc:/data/gethdata/geth.ipc

11 ethereum cmd

miner.setEtherbase(ac1)
miner.start(10)
eth.mining

nohup geth --datadir="/data/gethdata" --rpc --rpcaddr=0.0.0.0 --rpcport=8545 --cache=512 --maxpeers 9999 --rpcapi=“web3,eth,net,personal,db,admin” --rpccorsdomain="*" > ./geth.log &2>1

geth attach ipc:/data/gethdata/geth.ipc

11 ethereum cmd

miner.setEtherbase(ac1)
miner.start(10)
eth.mining

nohup geth --datadir="/data/gethdata" --rpc --rpcaddr=0.0.0.0 --rpcport=8545 --cache=512 --maxpeers 9999 --rpcapi=“web3,eth,net,personal,db,admin” --rpccorsdomain="*" > ./geth.log &2>1

geth attach ipc:/data/gethdata/geth.ipc

11 ethereum cmd

miner.setEtherbase(ac1)
miner.start(10)
eth.mining

nohup geth --datadir="/data/gethdata" --rpc --rpcaddr=0.0.0.0 --rpcport=8545 --cache=512 --maxpeers 9999 --rpcapi=“web3,eth,net,personal,db,admin” --rpccorsdomain="*" > ./geth.log &2>1

geth attach ipc:/data/gethdata/geth.ipc

11 ethereum cmd

miner.setEtherbase(ac1)
miner.start(10)
eth.mining

nohup geth --datadir="/data/gethdata" --rpc --rpcaddr=0.0.0.0 --rpcport=8545 --cache=512 --maxpeers 9999 --rpcapi=“web3,eth,net,personal,db,admin” --rpccorsdomain="*" > ./geth.log &2>1

geth attach ipc:/data/gethdata/geth.ipc

12



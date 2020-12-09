#Since 2020.12.02 ezzcs
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

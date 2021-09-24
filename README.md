1. install rabbitmq

sudo apt install -y rabbitmq-server
sudo service rabbitmq-server stop
sudo service rabbitmq-server start
sudo service rabbitmq-server restart


sudo rabbitmqctl add_user admin pwd123
sudo rabbitmqctl set_user_tags admin administrator
sudo rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"


hostname -I

web server port: 15672


Since 2021.08.31
The history file in src/doc/Readme

1 install docker
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

/etc/yum.repos.d
vim docker-ce.repo
baseurl=https://mirrors.aliyun.com/docker-ce/linux/centos/8.9/$basearch/stable



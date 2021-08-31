#!/bin/bash


############################ Docker CE ################################
## Reference website

# https://www.runoob.com/docker/ubuntu-docker-install.html
# https://docs.docker.com/install/linux/docker-ce/ubuntu/
# https://docs.docker.com/engine/install/ubuntu/

## Remove old version docker
# sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

## Docker requirements
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

## Add Docker’s official GPG key:
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


## Verify that you now have the key with the fingerprint 
## 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, 
## by searching for the last 8 characters of the fingerprint.

# sudo add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"


## Aliyun
curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"


sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io



## 免sudo运行docker
sudo groupadd docker 
sudo gpasswd -a ${USER} docker
sudo service docker restart
pkill X

## 卸载Docker CE
## 卸载Docker CE软件包：
# sudo apt-get purge docker-ce
## 主机上的图像，容器，卷或自定义配置文件不会自动删除。要删除所有图像，容器和卷：
# sudo rm -rf /var/lib/docker


############################ Docker CE 简易安装################################

curl https://get.docker.com | sh \
  && sudo systemctl start docker \
  && sudo systemctl enable docker

############################ NV Docker ################################

# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker

distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list


## experimental features such as CUDA on WSL or the new MIG capability on A100
#curl -s -L https://nvidia.github.io/nvidia-container-runtime/experimental/$distribution/nvidia-container-runtime.list | sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list

sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo systemctl restart docker


#######################################################################






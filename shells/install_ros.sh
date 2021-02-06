#!/bin/bash

## Set ROS Keys

sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
## 如果上面执行有问题，请使用下面方式
# sudo sh -c 'echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'


## 设置密钥
# wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
# wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | apt-key add -

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

## Install ROS
## http://wiki.ros.org/melodic/Installation/Ubuntu


sudo apt update
sudo apt install ros-melodic-desktop-full -y







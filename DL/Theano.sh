#!/bin/bash

## Theano Install on Ubuntu

sudo  apt-get  update

# 安装gfortran,后面编译过程中会用到
sudo apt-get install gfortran

# 安装blas,Ubuntu下对应的是libopenblas，
#其它操作系统可能需要安装其它版本的blas——这是个OS相关的
sudo apt-get install libopenblas-dev -y
# 安装lapack，Ubuntu下对应的是liblapack-dev，和OS相关。
sudo apt-get install liblapack-dev

# 安装atlas，Ubuntu下对应的是libatlas-base-dev，和OS相关。
sudo apt-get install libatlas-base-dev
# 使用pip安装numpy和scipy
sudo apt-get install python-pip
sudo pip install numpy  
python -c "import numpy; numpy.test()"
sudo pip install scipy  
python -c"import scipy; scipy.test()"  

sudo apt-get install python-dev  
sudo apt-get install python-pip  
sudo apt-get install python-nose  
sudo apt-get install g++  
sudo apt-get install git  

sudo pip install Theano 
python -c "import theano; theano.test()" 
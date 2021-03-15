
## 安装与运行: https://github.com/lgsvl/apollo-5.0
## Instructions to build standalone executable:
# https://www.lgsvlsimulator.com/docs/build-instructions/
## Simulator Instructions:
# https://www.lgsvlsimulator.com/docs/getting-started/#simulator-instructions




########## Docker, 仓库离线下载 ##########
## 下载并加载 docker image
bash download-frozen-image-v2.sh apolloauto-apollo apolloauto/apollo:dev-x86_64-18.04-20210126_2027
bash download-frozen-image-v2.sh lgsvl-apollo-5.0 lgsvl/apollo-5.0:latest

tar -cC 'lgsvl-apollo-5.0' . | docker load
tar -cC 'apolloauto-apollo' . | docker load

## 执行命令:
## https://github.com/lgsvl/apollo-5.0
# 已下载到本地, 并加载
docker pull lgsvl/apollo-5.0
# 仓库较大, 已下载到本地: apollo-5.0-simulator.zip 
git clone --recurse-submodules https://github.com/lgsvl/apollo-5.0.git

########## Building Apollo and bridge 编译Apollo ##########
## 在apollo-5.0-simulator文件夹下执行:

## 启动docker
# https://github.com/ApolloAuto/apollo/blob/master/docs/cyber/CyberRT_Docker.md
# 此处会拉取最新的几个依赖docker镜像（拉取速度较慢，可考虑离线下载，手动load）：
# apolloauto/apollo:yolo3d_volume-x86_64-latest
# apolloauto/apollo:localization_volume-x86_64-latest
# apolloauto/apollo:paddlepaddle_volume-x86_64-latest
# apolloauto/apollo:local_third_party_volume-x86_64-latest
./docker/scripts/dev_start.sh
# bash docker/scripts/cyber_start.sh -g cn

## 进入docker:
./docker/scripts/dev_into.sh
## 编译, 会从git拉取仓库, 需要设置代理. docker里可以直接设置 export http_proxy
# export http_proxy="127.0.0.1:7890"; export https_proxy=$http_proxy
# 如果proxy无效， 则在/apollo/WORKSPACE.in里,第47到第53,替换成:
# #ad-rss-lib
# new_git_repository(
#     name = "ad_rss_lib",
#     build_file = "third_party/rss_lib.BUILD",
#     tag = "v1.1.0",
#     remote = "https://gitee.com/audier0879/ad-rss-lib",
# )
./apollo.sh build_gpu

########## Launching Apollo alongside the simulator
## To start Apollo:
cd /apollo
# bootstrap.sh
./scripts/bootstrap_lgsvl.sh
## Launch bridge (inside docker container):
# 默认端口: 9090
# sudo ss -ltnap | grep 9090
# bridge.sh
./scripts/bridge.sh

# http://localhost:8888/




## Run the LG SVL Simulator outside of docker.
# https://www.lgsvlsimulator.com/docs/getting-started/#simulator-instructions
# http://localhost:8080/#/Simulations
cd 2020.06/lgsvlsimulator-linux64-2020.06 
./simulator

########### Stop the Docker
./docker/scripts/dev_start.sh stop



./docker/scripts/dev_start.sh
./docker/scripts/dev_into.sh
http://localhost:8888/
http://localhost:8080

bootstrap.sh
bridge.sh





### Apollo demo:

cd docs/demo_guide/

python rosbag_helper.py demo_3.5.record
cyber_recorder play -f demo_3.5.record --loop

# 此时如果显示没有cyber_recorder，那就在dev docker下执行source，类似ros中的source。
source cyber/setup.bash



cyber_record_car.sh 


## 提高docker拉取速度 https://my.oschina.net/fyangw/blog/4738542


## Others
cyber_visualizer



## Apollo 3.0

#录制前
rosparam set /use_sim_time false
#播放时
rosparam set /use_sim_time true
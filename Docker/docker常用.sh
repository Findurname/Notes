## 1.容器的创建、查看、删除

docker run [-it] some-image 创建某个镜像的容器。注意，同一个镜像可以通过这种方式创建任意多个container. 加上-it之后，可以创建之后，马上进入交互模式。
docker ps 列出当前运行的容器
docker ps -a 列出所有的容器，包括运行的和不运行的
docker rm container-id 删除某个容器


## 2.容器的启动、进入、退出：

sudo docker run -t -i Image
docker start [-i] container-id 启动某个容器，必须是已经创建的。 加上-i 参数之后，可以直接进入交互模式：

除了通过-i进入交互模式，还有一种方法，那就是通过attach: docker attach container-id
进入交互模式之后，怎么退出呢： - 想退出但是保持容器运行，按CTRL+Q+P三个键 - 退出，并关闭停止容器，按CTRL+D或者输入exit再回车

注：Ctrl+P+Q按的时候有时候会不灵，多按几次！
容器的停止、重启： docker stop container-id docker restart container-id

## 3. Create docker from dockerfile

# 构建docker image命令如下：
docker build -t python:3.6 .
# 运行docker image命令如下：
docker run -ti --rm python:3.6
sudo docker run -ti --rm python:3.6


## 4. Docker复制

## 从主机复制到容器
sudo docker cp host_path containerID:container_path
## 从容器复制到主机
sudo docker cp containerID:container_path host_path
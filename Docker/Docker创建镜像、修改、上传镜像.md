# Docker 创建镜像、修改、上传镜像

## 一、创建镜像

创建镜像有很多方法，用户可以从 Docker Hub 获取已有镜像并更新，也可以利用本地文件系统创建一个。

## 二、修改已有镜像

### 1、先使用下载的镜像启动容器。

```bash
$ docker run -t -i training/sinatra /bin/bash
root@0b2616b0e5a8:/#
```
注意：记住容器的 ID，稍后还会用到。

### 2、在容器中添加 json 和 gem 两个应用。

```bash
root@0b2616b0e5a8:/# gem install json
```
当结束后，我们使用 exit 来退出，现在我们的容器已经被我们改变了，使用 docker commit 命令来提交更新后的副本。

```bash
$ sudo docker commit -m "Added json gem" -a "Docker Newbee" 0b2616b0e5a8 ouruser/sinatra:v2
```
4f177bd27a9ff0f6dc2a830403925b5360bfe0b93d476f7fc3231110e7f71b1c

其中，-m 来指定提交的说明信息，跟我们使用的版本控制工具一样；-a 可以指定更新的用户信息；之后是用来创建镜像的容器的 ID；最后指定目标镜像的仓库名和 tag 信息。创建成功后会返回这个镜像的 ID 信息。

使用 docker images 来查看新创建的镜像。

```bash
$ sudo docker images
REPOSITORY     TAG   IMAGE ID    CREATED    VIRTUAL SIZE
training/sinatra  latest 5bc342fa0b91  10 hours ago 446.7 MB
ouruser/sinatra   v2   3c59e02ddd1a  10 hours ago 446.7 MB
ouruser/sinatra   latest 5db5f8471261  10 hours ago 446.7 MB
```

之后，可以使用新的镜像来启动容器

```bash
$ sudo docker run -t -i ouruser/sinatra:v2 /bin/bash
root@78e82f680994:/#
```

## 三、利用 Dockerfile 来创建镜像

使用 docker commit 来扩展一个镜像比较简单，但是不方便在一个团队中分享。我们可以使用 docker build 来创建一个新的镜像。为此，首先需要创建一个 Dockerfile，包含一些如何创建镜像的指令。
新建一个目录和一个 Dockerfile

```bash
$ mkdir sinatra
$ cd sinatra
$ touch Dockerfile
```
Dockerfile 中每一条指令都创建镜像的一层，例如：

```bash
# This is a comment
FROM ubuntu:14.04
MAINTAINER Docker Newbee <newbee@docker.com>
RUN apt-get -qq update
RUN apt-get -qqy install ruby ruby-dev
RUN gem install sinatra
```

Dockerfile 基本的语法是

使用 # 来注释 

```FROM``` 指令告诉 Docker 使用哪个镜像作为基础 

接着是维护者的信息 

```RUN``` 开头的指令会在创建中运行，比如安装一个软件包，在这里使用 apt-get 来安装了一些软件

编写完成 Dockerfile 后可以使用 docker build 来生成镜像。

```bash
$ sudo docker build -t="ouruser/sinatra:v2" .
```

其中 ```-t``` 标记来添加 tag，指定新的镜像的用户信息。```“.”``` 是 Dockerfile 所在的路径（当前目录），也可以替换为一个具体的 Dockerfile 的路径。

此外，还可以利用 ADD 命令复制本地文件到镜像；用 EXPOSE 命令来向外部开放端口；用 CMD 命令来描述容器启动后运行的程序等。例如

```bash
# put my local web site in myApp folder to /var/www
ADD myApp /var/www
# expose httpd port
EXPOSE 80
# the command to run
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
```

现在可以利用新创建的镜像来启动一个容器。

```bash
$ sudo docker run -t -i ouruser/sinatra:v2 /bin/bash
root@8196968dac35:/#
```
还可以用 docker tag 命令来修改镜像的标签。

```bash
$ sudo docker tag 5db5f8471261 ouruser/sinatra:devel
$ sudo docker images ouruser/sinatra
REPOSITORY     TAG   IMAGE ID   CREATED    VIRTUAL SIZE
ouruser/sinatra   latest 5db5f8471261 11 hours ago  446.7 MB
ouruser/sinatra   devel  5db5f8471261 11 hours ago  446.7 MB
ouruser/sinatra   v2   5db5f8471261 11 hours ago  446.7 MB
```

## 四、从本地文件系统导入

要从本地文件系统导入一个镜像，可以使用 openvz（容器虚拟化的先锋技术）的模板来创建：openvz 的模板下载地址为templates 。

比如，先下载了一个 ubuntu-14.04 的镜像，之后使用以下命令导入：

```bash
sudo cat ubuntu-14.04-x86_64-minimal.tar.gz |docker import - ubuntu:14.04
```

然后查看新导入的镜像。

```bash
docker images
REPOSITORY     TAG         IMAGE ID      CREATED       VIRTUAL SIZE
ubuntu       14.04        05ac7c0b9383    17 seconds ago   215.5 MB
```

## 五、上传镜像

用户可以通过 docker push 命令，把自己创建的镜像上传到仓库中来共享。例如，用户在 Docker Hub 上完成注册后，可以推送自己的镜像到仓库中。

```bash
$ sudo docker push ouruser/sinatra
The push refers to a repository [ouruser/sinatra] (len: 1)
Sending image list
Pushing repository ouruser/sinatra (3 tags)
```

# Docker镜像保存为文件及从文件导入镜像的方法

## 1、概述

我们制作好镜像后，有时需要将镜像复制到另一台服务器使用。

能达到以上目的有两种方式，一种是上传镜像到仓库中（本地或公共仓库），但是另一台服务器很肯能只是与当前服务器局域网想通而没有公网的，所以如果使用仓库的方式，只能自己搭建私有仓库，这会在另一篇文章中介绍。

如果我们仅仅是要复制到另外少数的服务器，搭建私有仓库显然没有这个必要，而将镜像保存为文件上传到其他服务器再从文件中载入镜像也是一个不错的选择。

可以使用Docker save和Docker load命令来存储和载入镜像。

## 2、保存镜像为文件

如果要讲镜像保存为本地文件，可以使用Docker save命令。

命令格式：
```bash
docker save -o 要保存的文件名  要保存的镜像
```

## 3、从文件载入镜像

从文件载入镜像可以使用Docker load命令。

命令格式：
```bash
docker load --input 文件
```
或者
```bash
docker load < 文件名
```

# Docker镜像制作详解介绍

## 推荐用Docker File制作docker镜像。

### 1、基础镜像

我选用的是从Docker官网下载的ubuntu镜像。
```bash
docker run ubuntu
```

或者
```bash
docker pull ubuntu
```

### 2、安装ssh服务

```
docker run -i -t ubuntu /bin/bash #创建一个容器，-t是临时终端。
```

进入ubuntu后，安装openssh
```
apt-get install openssh-server #安装ssh
```

```
#需要修改/etc/sshd/sshd_config文件中内容
PermitRootLogin yes
UsePAM no
```

修改ubuntu的root用户密码，以便以后ssh登陆：
```
sudo passwd root
```

### 3、制作新的镜像

到此，我们需要把这个带有ssh服务的容器提交成一个镜像，方便以后在这个基础上各种改造：
```
docker commit <container id> <image name>
```

### 4、基于现有ssh服务的Ubuntu镜像，加入django项目，并设置随容器自启动

经过以上步骤，```doker images```可以查看，新提交的doker镜像已经在里面了，例如image name为```ssh-ubuntu```的新镜像。
最基础的Ubuntu容器已经没有作用了
利用

```
doker stop <container id>
doker rm <Container id>
```
清除刚刚启动的最基础的Ubuntu容器

下面，要基于我们新的ssh-ubuntu进行个性化定制，首先，要将这个镜像运行起来
```
docker run -d -p 5001:22 ssh-ubuntu /usr/sbin/sshd -D

## -p为端口映射 容器中22端口应射程主机5001端口 
##/usr/sbin/sshd -D是指定容器启动后要运行的command，本处是启动ssh服务
```

容器启动后，我们可以通过ssh的方式，登陆到容器中

```
ssh root@doker0_ip -p 5001(22映射端口)
```

进入到容器后，就可以进行下一步个性化定制了。例如我要把我的django项目放到镜像中，并随着容器启动而启动。

（1）把django项目拷贝到容器中，用scp命令即可。

（2）比较通用的开机启动进程方法：

安装supervisor!
```
apt-get update && apt-get install supervisor
```


然后编辑配置文件，
```
vi /etc/supervisord.conf
```

```
[supervisord]
nodaemon=true
[program:sshd]
command=/usr/sbin/sshd -D
 
[program:tomcat]
command=python ~/manager.py runserver 0.0.0.0:9999
```
然后保存退出即可。

用3小节方法重新制作新的镜像，清除当前容器即可。

## 5、运行新镜像

```
docker run -d -p 5001:22 -p 5000:9999 <image-name> /etc/supervisord
```

此时，可以访问主机5000端口，看看能不能访问到容器里面的django项目。
镜像制作大体过程至此完成。

docker 本身是有push 来上传的 index.docker.io 的，使用是用pull拉取。但是没有条件搭建本地docker仓库或者需要将应用导出到另外一个Docker环境中，我们可以将docker镜像导出到一个文件，具体做法如下：

```
sudo docker export <容器id>  >  docker_app.tar
```

完成后我们刚才制作的容器就导出成了 ```docker_app.tar``` 文件, 以后在其他机器部署的时候执行导入

```
cat docker_app.tar | sudo docker import - docker_app
```

管道后面的 docker_app 为导入后image命名，自己指定。



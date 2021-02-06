# Notes

[toc]

## DF-S32 jenkins编译 

### 新建 jenkins source脚本（在jenkins里source会出错）

```
echo "#!/usr/bin/env bash\nsource /home/wangxingwei/S32_prebuild/S32/apollo-platform-master/ros/devel_isolated/setup.bash" > env.sh
chmod 777 env.sh
./env.sh
```

### 修改脚本

```
sed -i 's/\~\/S32_prebuild/\/home\/wangxingwei\/S32_prebuild/' build_s32v.sh
chmod 777 build_s32v.sh
./build_s32v.sh
```


## DW

UVC协议

### 曝光时间

```
float32_t	exposureTime	Specifies the exposure time (microsecond)
```


## ubuntu

### 

```
sudo rsync -av --progress /home/jerry/* ./
```
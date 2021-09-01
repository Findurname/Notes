## 1、查看当前swap分区大小
free -m


## 2、 查看swap分区挂载位置
cat /proc/swaps


## 3、停止交换分区
sudo swapoff /swap/swapfile


## 4、删除分区文件
sudo rm /swap/swapfile


## 5、建立swapfile这里新建的swap分区是10G，bs x count = 1024 × 10000000 = 10G

sudo mkdir /swap
cd /swap

sudo dd if=/dev/zero of=swapfile bs=1024 count=20000000


## 6、使用新分区
## 如果新建分区文件可以省去给权限和 mkswap -f 的操作。

sudo chmod 600 /swap/swapfile 
sudo mkswap -f /swap/swapfile
sudo swapon /swap/swapfile


##7、查看新swap分区
free -m
cat /proc/swaps

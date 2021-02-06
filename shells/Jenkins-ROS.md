# Jenkins ROS

http://192.168.0.181:8081

```
cd $WORKSPACE
mkdir ../tmp
# catkin_make
mv * ../tmp
mkdir src
mv ../tmp/* src
cd src; catkin_init_workspace
cd $WORKSPACE
catkin_make
rm -r ../tmp
source ./devel/setup.bash

catkin_make
catkin_make
```

## Ros Sites
http://wiki.ros.org/buildfarm
https://github.com/ros-infrastructure/ros_buildfarm

https://github.com/ros-infrastructure/ros_buildfarm/blob/master/doc/index.rst


https://github.com/ros-infrastructure/ros_buildfarm/blob/master/doc/jobs/release_jobs.rst


# RosberryPi

Rpi 4B+ with Ros melodic and Realsense.
Recommed steps as follows:

## (optional) Change default server (apt and pip)

[script](apt-buster/replace.sh) for apt

[script](apt-buster/pip.sh) for pip


## (optional) Config system proxy (v2ray + proxychains4)

[script](v2ray32/main.sh) for all. Note you need to get v2ray pkg manually if you can't access it on RPI.

## 1. Update the packages

sudo apt update && sudo apt upgrade

## 2. Ros

[script](ros/install_ros_melodic.sh) for ROS melodic (desktop)

(optional) [script](ros/install_turtle_melodic.sh) for turtlebot3 (after ros installed)

## 3. Realsense

[script](realsense/install.sh) for install realsense



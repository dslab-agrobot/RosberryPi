#!/usr/bin/bash

echo -e "\e[0;34mInstall Ros-Realsense\e[0m"

echo -e "\e[0;31mDO NOT\e[0m complie librealsense 2 with default config."



echo -e "\e[0;34mInstall dependences\e[0m"


sudo apt-get install python-defusedxml python-netifaces gnupg

echo -e "\e[0;34mDownload and install\e[0m"

/home/pi/catkin_ws/src
git clone https://github.com/IntelRealSense/realsense-ros.git
cd /home/pi/catkin_ws/src/realsense-ros/

# Do not checkout in latest version like https://blog.csdn.net/AnChenliang_1002/article/details/109454465
# Cause unknow make type error
proxychains4 git checkout `git tag | sort -V | grep -P "^2.\d+\.\d+" | tail -1`

cd /home/pi/catkin_ws/
sudo -u pi /home/pi/catkin_ws/src/catkin/bin/catkin_make_isolated  --install-space=/opt/ros/melodic --install --pkg realsense2_camera realsense2_description

echo -e "\e[0;34mDone !\e[0m"



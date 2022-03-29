#!/usr/bin/bash

echo -e "\e[0;34mInstall Ros-Realsense\e[0m"

echo -e "\e[0;31mDO NOT\e[0m complie librealsense 2 with default config."



echo -e "\e[0;34mInstall dependences\e[0m"


sudo apt-get install -y python-defusedxml python-netifaces gnupg


echo -e "\e[0;34mDownload and install\e[0m"

cd /home/pi/catkin_ws/src
proxychains4 git clone https://github.com/pal-robotics/ddynamic_reconfigure.git
proxychains4 git clone https://github.com/IntelRealSense/realsense-ros.git
cd /home/pi/catkin_ws/src/realsense-ros/

# Do not checkout in latest version like https://blog.csdn.net/AnChenliang_1002/article/details/109454465
# Cause unknow make type error
proxychains4 git checkout `git tag | sort -V | grep -P "^2.\d+\.\d+" | tail -1`

cd /home/pi/catkin_ws/
sudo -u pi /home/pi/catkin_ws/src/catkin/bin/catkin_make_isolated  --install-space=/opt/ros/melodic --install --pkg ddynamic_reconfigure realsense2_camera realsense2_description

echo -e "\e[0;34mDone !\e[0m"

# initial_reset:=true

# roslaunch realsense2_camera rs_camera.launch filters:=pointcloud depth_width:=424 color_width:=424 depth_height:=240 color_height:=240 depth_fps:=15 color_fps:=15 pointcloud_texture_stream:=RS2_STREAM_COLOR wait_for_device_timeout:=-1.0 initial_reset:=true

# roslaunch realsense2_camera rs_camera.launch filters:=pointcloud depth_width:=848 color_width:=848 depth_height:=480 color_height:=480 depth_fps:=15 color_fps:=15 pointcloud_texture_stream:=RS2_STREAM_COLOR wait_for_device_timeout:=-1.0

echo -e "Try a specific command like \n \e[0;34mroslaunch realsense2_camera rs_camera.launch filters:=pointcloud depth_width:=424 color_width:=424 depth_height:=240 color_height:=240 depth_fps:=15 color_fps:=15 pointcloud_texture_stream:=RS2_STREAM_COLOR !\e[0m"






#!/usr/bin/bash

echo -e "\e[0;34mDownload Ros melodic\e[0m"

cd /home/pi/catkin_ws

proxychains4 rosinstall_generator rosserial-python hls-lfcd-lds-driver turtlebot3-msgs dynamixel-sdk turtlebot3 --deps --exclude RPP
proxychains4 wstool merge -t src  
proxychains4 wstool update -t src

echo -e "\e[0;34mCompiling Ros and Install\e[0m"
/home/pi/catkin_ws/src/catkin/bin/catkin_make_isolated  --install-space=/opt/ros/melodic --install

# source /opt/ros/melodic/setup.bash
source /opt/ros/melodic/setup.zsh
# echo "source /opt/ros/melodic/setup.bash" >> /home/pi/.bashrc

echo -e "\e[0;34mDone !\e[0m"



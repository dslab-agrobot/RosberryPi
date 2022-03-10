#!/usr/bin/bash

echo -e "run this script \e[0;31m sudo -u pi bash install_ros_melodic.sh\e[0m"


echo "It's highly recommended to run this script under VPN like v2ray+proxychains4"
echo "Or you need to uncomment the part to replace github url by python package"

echo -e "\e[0;34mInstall rosdep, rosgenerator \e[0m"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F42ED6FBAB17C654
sudo apt install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential python-empy cmake

echo -e "\e[0;34mInstall pkgs for qt \e[0m" 
sudo apt-get install at-spi2-core
sudo apt-get install sip-dev pyqt5-dev python-sip-dev pyqt5-dev-tools
echo "export QT_QPA_PLATFORMTHEME='qt5ct'" >> /home/pi/.bashrc
echo "export QT_QPA_PLATFORMTHEME='qt5ct'" >> /home/pi/.zshrc



sudo rosdep init

sudo mv /etc/ros/rosdep/sources.list.d/20-default.list /etc/ros/rosdep/sources.list.d/20-default.list.bac
sudo mv /etc/apt/sources.list.d/ros-latest.list /etc/apt/sources.list.d/ros-latest.list.bac
sudo echo 'deb http://mirrors.ustc.edu.cn/ros/ubuntu/ buster main
deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ buster main
deb http://mirror-ap.packages.ros.org/ros/ubuntu/ buster main
' > /etc/apt/sources.list.d/ros-latest.list

# If you have no VPN, you could try on Github mirror like below
# sudo pip3 install text_replace 
# sudo -H python3 -m text_replace -d /usr/lib/python2.7/dist-packages/rosdep2 -r -f .py$ -t https://raw.githubusercontent.com/ -n https://ghproxy.com/https://raw.githubusercontent.com/
# sudo -H python3 -m text_replace -d /usr/lib/python2.7/dist-packages/rosdistro -r -f .py$ -t https://raw.githubusercontent.com/ -n https://ghproxy.com/https://raw.githubusercontent.com/


# sudo rosdep fix-permissions

echo -e "\e[0;34mDefault on Proxychains4\e[0m"
proxychains4 rosdep update

# without proxy, you need to wait
# rosdep update

echo -e "\e[0;34mDownload Ros melodic\e[0m"

mkdir -p /home/pi/catkin_ws
cd /home/pi/catkin_ws
proxychains4 rosinstall_generator desktop --rosdistro melodic --deps --wet-only --tar > /home/pi/catkin_ws/melodic-desktop-wet.rosinstall
proxychains4 wstool init src /home/pi/catkin_ws/melodic-desktop-wet.rosinstall
proxychains4 rosdep install -y --from-paths /home/pi/catkin_ws/src --ignore-src --rosdistro melodic -r --os=debian:buster

echo -e "\e[0;34mCompiling Ros and Install\e[0m"

cd /home/pi/catkin_ws
sudo mkdir -p /opt/ros/melodic
sudo chown -R pi:pi /opt/ros/melodic 

echo -e "\e[0;34mCompiling Ros and Install\e[0m"
echo -e "\e[0;34mDefault catkin_make_isolated\e[0m"
# /home/pi/catkin_ws/src/catkin/bin/catkin_make -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic install
/home/pi/catkin_ws/src/catkin/bin/catkin_make_isolated  --install-space=/opt/ros/melodic --install

source /opt/ros/melodic/setup.bash
source /opt/ros/melodic/setup.zsh
echo "source /opt/ros/melodic/setup.bash" >> /home/pi/.bashrc
echo "source /opt/ros/melodic/setup.bash" >> /home/pi/.zshrc

echo -e "\e[0;34mDone !\e[0m"
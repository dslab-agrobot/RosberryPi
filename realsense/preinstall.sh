
echo -e "run this script \e[0;34m sudo -u pi bash preinstall.sh\e[0m"
echo -e "\e[0;34mDefault on Proxychains4\e[0m"

echo -e "\e[0;34mPre-install Requirements\e[0m"

# sudo apt-get update && sudo apt-get dist-upgrade
sudo apt-get install automake libtool vim cmake libusb-1.0-0-dev libx11-dev xorg-dev libglu1-mesa-dev python3-protobuf -y

cd /home/pi
proxychains4 git clone https://github.com/IntelRealSense/librealsense.git /home/pi/librealsense

# uncoment this if you need UDEV other than RSUSB.
# NOTE: UDEV will cause conflict on realsens2_camera on ros melodic raspbian buster. 
# cd /home/pi/librealsense
# sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/ 


echo -e "\e[0;32mPlz apply the udev change manually\e[0m"
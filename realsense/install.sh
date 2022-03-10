#!/usr/bin/bash
echo -e "run this script \e[0;34m sudo -u pi bash install.sh\e[0m"
echo -e "\e[0;34mRun preinstall.sh. Then create new udev on root\e[0m"
echo -e "\e[0;34mDefault on Proxychains4\e[0m"


echo "export LD_LIBRARY_PATH=/usr/local/lib:\$LD_LIBRARY_PATH" >> /home/pi/.zshrc
source /home/pi/.zshrc

echo -e "\e[0;34mInstallation\e[0m"


# uncoment this if you need UDEV other than RSUSB.
# NOTE: UDEV will cause conflict on realsens2_camera on ros melodic raspbian buster.
# echo -e "\e[0;34mInstall libtbb-dev parallelism library for C++\e[0m"
# cd /home/pi
# proxychains4 wget https://github.com/PINTO0309/TBBonARMv7/raw/master/libtbb-dev_2018U2_armhf.deb
# sudo dpkg -i ~/libtbb-dev_2018U2_armhf.deb
# sudo ldconfig
# rm libtbb-dev_2018U2_armhf.deb

echo -e "\e[0;34mInstall RealSense SDK librealsense\e[0m"
echo -e "\e[0;34mBuild on RSUSB very slow\e[0m"

# use proxy due to git clone
cd /home/pi/librealsense/
mkdir  /home/pi/librealsense/build  && cd /home/pi/librealsense/build

# uncoment this if you need UDEV other than RSUSB.
# NOTE: UDEV will cause conflict on realsens2_camera on ros melodic raspbian buster.
# proxychains4 cmake /home/pi/librealsense -DBUILD_EXAMPLES=true -DCMAKE_BUILD_TYPE=Release -DFORCE_LIBUVC=true
proxychains4 cmake /home/pi/librealsense -DBUILD_PYTHON_BINDINGS:bool=true -DCMAKE_BUILD_TYPE=Release -DFORCE_RSUSB_BACKEND=true -DPYTHON_EXECUTABLE=$(which python2)
proxychains4 make -j4
sudo make install


echo "export PYTHONPATH=\$PYTHONPATH:/usr/local/lib" >> /home/pi/.zshrc
source /home/pi/.zshrc

echo -e "\e[0;34mInstall OpenGL\e[0m"

sudo apt-get install python-opengl
sudo -H pip3 install pyopengl -i https://pypi.tuna.tsinghua.edu.cn/simple

# Change the package if you are on the other os
# sudo -H pip3 install pyopengl_accelerate==3.1.3rc1 -i https://pypi.tuna.tsinghua.edu.cn/simple

proxychains4 wget https://www.piwheels.org/simple/pyopengl-accelerate/PyOpenGL_accelerate-3.1.3rc1-cp37-cp37m-linux_armv7l.whl
sudo -H pip3 install PyOpenGL_accelerate-3.1.3rc1-cp37-cp37m-linux_armv7l.whl

echo -e "\e[0;32mPlz change pi settings (enable OpenGL): manually\e[0m"

echo -e "sudo raspi-config
7. Advanced Options" - "A8 GL Driver" - "G2 GL (Fake KMS)"
echo -e "Full note see in\e[0;32mhttps://github.com/datasith/Ai_Demos_RPi/wiki/Raspberry-Pi-4-and-Intel-RealSense-D435\e[0m"



# Intel realsens D455

# 1. Config the swap space

+ Increase swap to 2GB by changing the file below to CONF_SWAPSIZE=2048:

```
sudo vi /etc/dphys-swapfile
```

+ Apply the change:

```
sudo /etc/init.d/dphys-swapfile restart swapon -s
```

Original url from (datasith)[https://github.com/datasith/Ai_Demos_RPi/wiki/Raspberry-Pi-4-and-Intel-RealSense-D435]

However, this method cause ros realsense2_camera fails to ***Load any resources**. So I fixed the problem by [Intel reply](https://github.com/IntelRealSense/librealsense/issues/7312#issuecomment-694701288).


# 2.Preinstall

sudo -u pi bash preinstall.sh

# 3. Apply the new udev rule
needs to be run by root, fails on 'sudo' or 'sudo -u root', MUST LOG AS `root`.
```bash
sudo su
udevadm control --reload-rules && udevadm trigger
exit
```
# 4.Install

sudo -u pi bash install.sh
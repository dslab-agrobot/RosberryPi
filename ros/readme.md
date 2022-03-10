# Ros and bundled packages

Ros melodic on raspbian(buster), you can find more info on [Ros wiki](http://wiki.ros.org/action/login/ROSberryPi)

turtlebot only offer out-date [tutorials](https://emanual.robotis.com/docs/en/platform/turtlebot3/bringup/#bringup). This is a ready-to-go script for beginer, allow them to build turtlebot3 from source.
Other os and board (like Nano with ubuntu) need a little revision.

## Preparation

All script use `proxychains4` to apply proxy on `v2ray`. You can uncomment them if you have no problem in network.

[turtlebot3](./install_turtle_melodic.sh) need ros-melodic installed.

[realsense](./install_realsense_melodic.sh) need librealsense installed. This could be found in here[librealsense](../realsense/readme.md)

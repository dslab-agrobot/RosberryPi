sudo cp /etc/apt/sources.list /etc/apt/sources.list.bac
sudo echo '# 编辑 `/etc/apt/sources.list` 文件，删除原文件所有内容，用以下内容取代：
deb [arch=armhf] http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib rpi
deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib rpi' > /etc/apt/sources.list
sudo cp /etc/apt/sources.list.d/raspi.list /etc/apt/sources.list.d/raspi.list.bac
sudo echo '# 编辑 `/etc/apt/sources.list.d/raspi.list` 文件，删除原文件所有内容，用以下内容取代：
deb http://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ buster main' > /etc/apt/sources.list.d/raspi.list

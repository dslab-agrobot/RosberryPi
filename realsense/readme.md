# Intel realsens D455

+ Increase swap to 2GB by changing the file below to CONF_SWAPSIZE=2048:

```
sudo vi /etc/dphys-swapfile
```

+ Apply the change:

```
sudo /etc/init.d/dphys-swapfile restart swapon -s
```

Original url from (datasith)[https://github.com/datasith/Ai_Demos_RPi/wiki/Raspberry-Pi-4-and-Intel-RealSense-D435]
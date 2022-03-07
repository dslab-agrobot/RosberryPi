# https://github.com/v2ray/v2ray-core/releases/download/v4.28.2/v2ray-linux-arm32-v7a.zip
sudo ./install-release.sh --local v2ray-linux-arm32-v7a.zip
sudo ./config.sh
sudo apt install proxychains4
# vim /etc/proxychains.conf
# - socks4 127.0.0.1 9050
# + socks5 127.0.0.1 1090
sudo systemctl enable v2ray 

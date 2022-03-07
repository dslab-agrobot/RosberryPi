cat > /usr/local/etc/v2ray/config.json << EOF
{
  "log": {
    "loglevel": "warning"
  },
  "inbounds": [
    {
      "tag": "proxy",
      "port": 1090, // 监听端口
      "listen": "127.0.0.1",
      "protocol": "socks", // 入口协议为 SOCKS 5
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      },
      "settings": {
        "auth": "noauth", //socks的认证设置，noauth 代表不认证，由于 socks 通常在客户端使用，所以这里不认证
        "udp": true
      },
      "streamSettings": null
    }
  ],
  "outbounds": [
    {
      "tag": "proxy",
      "protocol": "vmess", // 出口协议
      "settings": {
        "vnext": [
          {
            "address": "ADDRESS", // 服务器地址，请修改为你自己的服务器 IP 或域名
            "port": 8888,// 服务器端口
            "users": [
              {
                "id": "ID",  // 用户 ID，必须与服务器端配置相同
                "alterId": 32 // 此处的值也应当与服务器相同
              }
            ]
          }
        ]
      }
    }
  ]
}
EOF

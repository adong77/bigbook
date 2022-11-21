
Step 1: Install V2Ray on Ubuntu 22.04/20.04 Server
curl -O https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh
sudo bash install-release.sh

sudo systemctl enable v2ray
sudo systemctl restart v2ray  #Enable auto-start at system boot time.

systemctl enable v2ray; systemctl start v2ray

Step 3: Configure V2Ray on the Server
sudo nano /usr/local/etc/v2ray/config.json
{
"inbounds": [{
    "port": 10086,
    "protocol": "vmess",
    "settings": {
      "clients": [
        { 
          "id": "af66f0b6-68fe-11ed-9022-0242ac120002",
          "level": 1,
          "alterId": 64
        }
      ]
    }
  }],
  "outbounds": [{
    "protocol": "freedom",
    "settings": {}
  },{
    "protocol": "blackhole",
    "settings": {},
    "tag": "blocked"
  }]
 }
 
 Save and close the file. V2Ray server will listen on port 10086. Then restart V2Ray for the changes to take effect.
 sudo systemctl restart v2ray
 sudo ss -lnpt | grep v2ray
 
Step 4: Configure Firewall
sudo iptables -I INPUT -p tcp --dport 10086 -j ACCEPT

Step 5: Install and Configure V2Ray on Client Computer
Windows users can download V2Ray client from its Github release page. Click the Show all assets link, then you can find the V2Ray Windows ZIP file.

Unzip the file. You will find a config.json file. Use NotePad or your favorite text editor to open this file. Delete everything in this file, then add the following lines.

{
    "inbounds": [
        {
            "port": 1090, 
            "listen": "127.0.0.1",
            "protocol": "socks",
            "settings": {
                "udp": true
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "vmess",
            "settings": {
                "vnext": [
                    {
                        "address": "server_ip_address",
                        "port": 10086, 
                        "users": [
                            {
                                "id": "b831381d-6324-4d53-ad4f-8cda48b30811"
                            }
                        ]
                    }
                ]
            }
        },
        {
            "protocol": "freedom",
            "tag": "direct"
        }
    ],
    "routing": {
        "domainStrategy": "IPOnDemand",
        "rules": [
            {
                "type": "field",
                "ip": [
                    "geoip:private"
                ],
                "outboundTag": "direct"
            }
        ]
    }
}

Replace server_ip_address with your actual server IP address. The id parameter on V2Ray client must match the id parameter on V2Ray server. It’s like a pre-shared password.

Save and close the file. Then open Window Powershell and run the following command to start v2ray, assuming the v2ray-windows-64 folder is extracted in your Desktop folder.
. \\Desktop\v2ray-windows-64\v2ray run
PS C:\Users\youdn\Downloads\v2ray-windows-64> .\v2ray.exe run
 
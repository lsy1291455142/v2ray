#!/bin/sh
echo "========== ${RELEASE} =========="
echo "UUID: ${UUID}"
echo "========== $(date "+%Y-%m-%d") =========="

cat > config.json << EOF
{
    "inbounds": [
        {
            "port": ${PORT},
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "${UUID}"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF

chmod +x xray-1.3.1
./xray-1.3.1 -config config.json

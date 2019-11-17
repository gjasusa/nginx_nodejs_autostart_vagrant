#!/bin/bash

yum install nginx -y
yum enable --now nginx

curl -sL https://rpm.nodesource.com/setup_10.x | sudo -E bash -
yum install -y gcc-c++ make -y nodejs -y

npm install supervisor -g

echo "[Unit]
Description=Node.JS Systemd Unit file with Supervisor listener
Documentation=https://example.com
After=network.target

[Service]
Environment=NODE_PORT=6111
Type=simple
User=root
ExecStart=/bin/supervisor --watch /etc/nginx/ /etc/nginx/index.js
Restart=on-failure

[Install]
WantedBy=multi-user.target" > /lib/systemd/system/nodejs.service

systemctl daemon-reload
systemctl enable --now nodejs

yum install git -y
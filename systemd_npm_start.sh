#!/bin/bash

sudo touch /etc/systemd/system/2048-game.service

CONFIGURATION='[Unit]
Description=2048-game

[Service]
Type=simple
Restart=always
User=root
Group=root
WorkingDirectory=/home/vagrant/2048-game
ExecStart=/usr/local/bin/npm start

[Install]
WantedBy=multi-user.target
'

sudo tee -a /etc/systemd/system/2048-game.service <<< "$CONFIGURATION"

sudo systemctl enable --now 2048-game.service
sudo systemctl start 2048-game.service
ip a
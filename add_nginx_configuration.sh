#!/bin/bash
sudo sed -i 'd' /etc/nginx/sites-available/default

CONFIGURATION='
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    location / {
        proxy_pass http://127.0.0.1:8080;
    }
}
'

sudo tee -a /etc/nginx/sites-available/default <<< "$CONFIGURATION"
sudo systemctl restart nginx

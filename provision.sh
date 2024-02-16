# обновление
sudo apt-get update
sudo apt-get -y upgrade

# установка nginx
sudo apt-get install -y nginx

# очистка default конфигурации
sudo sed -i 'd' /etc/nginx/sites-available/default

# запись нужной нам конфигурации в default
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

# перезапуск nginx
sudo systemctl restart nginx

# скачивание игры
git clone https://gitfront.io/r/deusops/JnacRhR4iD8q/2048-game.git

# скачивание и установка nodejs, npm
wget https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.xz
sudo tar -C /usr/local --strip-components 1 -xf node-v20.11.0-linux-x64.tar.xz
sudo node -v && npm -v

# сборка игры
cd /home/vagrant/2048-game
npm install --include=dev
npm install -g npm@10.4.0
npm audit fix
npm run build

# создание службы для автоматического запуска npm
sudo touch /etc/systemd/system/2048-game.service

# запись конфигурации в файл службы
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

# включение автоматического запуска службы
sudo systemctl enable --now 2048-game.service

# запуск службы
sudo systemctl start 2048-game.service

# вывод ip
ip a
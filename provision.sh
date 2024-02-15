#скачивание игры
git clone https://gitfront.io/r/deusops/JnacRhR4iD8q/2048-game.git

#скачивание и установка nodejs, npm
wget https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.xz
sudo tar -C /usr/local --strip-components 1 -xf node-v20.11.0-linux-x64.tar.xz
sudo node -v && npm -v

#запуск игры
cd /home/vagrant/2048-game
npm install --include=dev
npm install -g npm@10.4.0
npm audit fix
npm run build


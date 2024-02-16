Vagrant.configure("2") do |config|
# образ системы Ubuntu focal64
  config.vm.box = "ubuntu/focal64"
# имя виртуальной машины
  config.vm.provider "virtualbox" do |vb|
    vb.name = "game-01"
    end
# hostname виртуальной машины
  config.vm.hostname = "game-01"
# добавление интерфейса публичной сети с пробросом портов
  config.vm.network "public_network", guest: 80, host: 8080
# запуск скрипта для автоматического развертывания игры
  config.vm.provision "shell", path: "provision.sh"
end
Vagrant.configure("2") do |config|
# образ системы Ubuntu focal64
  config.vm.box = "ubuntu/focal64"
# имя виртуальной машины
  config.vm.provider "virtualbox" do |vb|
    vb.name = "game-01"
    end
# hostname виртуальной машины
  config.vm.hostname = "game-01"
# настройки сети
  config.vm.network "public_network", guest: 80, host: 8080
    #use_dhcp_assigned_default_route: true
# установка пакетов
  config.vm.provision "update", type: "shell", inline: "echo Update; sudo apt-get update"
  config.vm.provision "upgrade", type: "shell", inline: "echo Upgrade; sudo apt-get -y upgrade"
  config.vm.provision "shell", path: "nginx_install.sh"
  config.vm.provision "shell", path: "add_nginx_configuration.sh"
  config.vm.provision "shell", path: "provision.sh"
  config.vm.provision "shell", path: "systemd_npm_start.sh"
end
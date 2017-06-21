# -*- mode: ruby -*-
# vi: set ft=ruby :

$installScript = <<SCRIPT
echo "Installing dependencies ..."
sudo apt-get update
sudo apt-get install -y unzip curl jq screen

cp /vagrant/consul /usr/bin/

sudo mkdir -p /etc/consul.d
sudo chmod a+w /etc/consul.d
SCRIPT

# copy the consul binary to this directory so that it will be mounted on the VM
system("
    if [ #{ARGV[0]} = 'up' ] || [ #{ARGV[0]} = 'provision' ]; then
	rm -f ./consul && cp ../../bin/consul .
    fi
")

# Specify a custom Vagrant box for the demo
DEMO_BOX_NAME = ENV['DEMO_BOX_NAME'] || "debian/jessie64"

# Vagrantfile API/syntax version.
# NB: Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = DEMO_BOX_NAME

  config.vm.define "n1" do |n1|
      n1.vm.hostname = "n1"
      n1.vm.network "private_network", ip: "172.20.20.11"
      n1.vm.provision "shell", "inline": $installScript
  end

  config.vm.define "n2" do |n2|
      n2.vm.hostname = "n2"
      n2.vm.network "private_network", ip: "172.20.20.10"
      n2.vm.provision "shell", "inline": $installScript
  end

  config.vm.define "n3" do |n1|
      n1.vm.hostname = "n1"
      n1.vm.network "private_network", ip: "172.20.20.12"
      n1.vm.provision "shell", "inline": $installScript
  end
end

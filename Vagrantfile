# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT

echo "Installing dependencies ..."
sudo apt-get update
sudo apt-get install -y unzip curl jq

cp /tmp/consul /usr/bin/

sudo mkdir -p /etc/consul.d
sudo chmod a+w /etc/consul.d

SCRIPT

# Specify a Consul version
CONSUL_DEMO_VERSION = ENV['CONSUL_DEMO_VERSION']

# Specify a custom Vagrant box for the demo
DEMO_BOX_NAME = ENV['DEMO_BOX_NAME'] || "debian/jessie64"

# Vagrantfile API/syntax version.
# NB: Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = DEMO_BOX_NAME

  config.vm.provision "file", source: "../../bin/consul", destination: "/tmp/consul"

  config.vm.provision "shell", inline: $script
                          

  config.vm.define "n1" do |n1|
      n1.vm.hostname = "n1"
      n1.vm.network "private_network", ip: "172.20.20.10"
  end

  config.vm.define "n2" do |n2|
      n2.vm.hostname = "n2"
      n2.vm.network "private_network", ip: "172.20.20.11"
  end
end

# -*- mode: ruby -*-
# vi: set ft=ruby sw=2 :

# This requires Vagrant 1.6.2 or newer (earlier versions can't reliably
# configure the Fedora 20 network stack).
Vagrant.require_version ">= 1.6.2"

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "lmarsden/flocker-tutorial"

  begin
    config.vm.box_version = "= " + ENV.fetch('FLOCKER_BOX_VERSION')
  rescue KeyError
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.define "master" do |master|
    master.vm.network :private_network, :ip => "172.16.255.140"
    master.vm.hostname = "master"
    master.vm.provider "virtualbox" do |v|
      v.memory = 1014
    end
    master.vm.provision "shell", inline: <<SCRIPT
mkdir -p /etc/flocker
echo 172.16.255.140 > /etc/flocker/my_address
echo 172.16.255.140 > /etc/flocker/master_address
SCRIPT
  end

  config.vm.define "node1" do |node1|
    node1.vm.network :private_network, :ip => "172.16.255.141"
    node1.vm.hostname = "node1"
    node1.vm.provider "virtualbox" do |v|
      v.memory = 1014
    end
    node1.vm.provision "shell", inline: <<SCRIPT
mkdir -p /etc/flocker
echo 172.16.255.141 > /etc/flocker/my_address
echo 172.16.255.140 > /etc/flocker/master_address
SCRIPT
  end

  config.vm.define "node2" do |node2|
    node2.vm.network :private_network, :ip => "172.16.255.142"
    node2.vm.hostname = "node2"
    node2.vm.provider "virtualbox" do |v|
      v.memory = 1014
    end
    node2.vm.provision "shell", inline: <<SCRIPT
mkdir -p /etc/flocker
echo 172.16.255.142 > /etc/flocker/my_address
echo 172.16.255.140 > /etc/flocker/master_address
SCRIPT
  end

  

end
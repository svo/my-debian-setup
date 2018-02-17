# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

unless Vagrant.has_plugin?("vagrant-cachier")
  puts "Install vagrant-cachier"
  exec 'vagrant plugin install vagrant-cachier && vagrant up'
end

unless Vagrant.has_plugin?("vagrant-vbguest")
  puts "Install vagrant-vbguest"
  exec 'vagrant plugin install vagrant-vbguest && vagrant up'
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian/stretch64"

  config.vm.hostname = "development-box-debian"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end

  config.cache.scope = :machine

  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end
end

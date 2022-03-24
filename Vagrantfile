# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'debian', primary: true do |debian|
    debian.vm.box = 'bento/debian-11'

    debian.vm.hostname = 'development-box-debian'

    debian.vm.provision 'shell', inline: 'sudo apt-get -y --allow-releaseinfo-change update'
    debian.vm.provision 'shell', inline: 'sudo apt-get install -y python3'

    debian.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'playbook.yml'
      ansible.extra_vars = { ansible_python_interpreter:'/usr/bin/python3' }
    end

    debian.vm.provision 'shell', inline: 'sudo update-rc.d ssh enable'

    debian.cache.scope = :machine

    debian.vm.provider :virtualbox do |vb|
      vb.memory = 2048
      vb.cpus = 4
      #vb.gui = true
      vb.customize ['modifyvm', :id, '--vram', '256']
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
  end

  config.vm.define 'ubuntu', primary: true do |ubuntu|
    ubuntu.vm.box = 'bento/ubuntu-21.04'

    ubuntu.vm.hostname = 'development-box-ubuntu'

    ubuntu.vm.provision 'shell', inline: 'sudo apt-get -y --allow-releaseinfo-change update'
    ubuntu.vm.provision 'shell', inline: 'sudo apt-get install -y python3'

    ubuntu.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'playbook.yml'
      ansible.extra_vars = { ansible_python_interpreter:'/usr/bin/python3' }
    end

    ubuntu.vm.provision 'shell', inline: 'sudo update-rc.d ssh enable'

    ubuntu.cache.scope = :machine

    ubuntu.vm.provider :virtualbox do |vb|
      vb.memory = 2048
      vb.cpus = 4
      #vb.gui = true
      vb.customize ['modifyvm', :id, '--vram', '256']
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
  end
end

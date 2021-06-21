# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'bento/debian-10'

  config.vm.hostname = 'development-box-debian'

  config.vm.provision 'shell', inline: 'sudo apt-get update'
  config.vm.provision 'shell', inline: 'sudo apt-get install -y python3'

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'playbook.yml'
    ansible.extra_vars = { ansible_python_interpreter:'/usr/bin/python3' }
  end

  config.vm.provision 'shell', inline: 'sudo update-rc.d ssh enable'
  config.vm.provision 'shell', inline: 'sudo apt-get install -y task-xfce-desktop'
  config.vm.provision 'shell', inline: 'sudo Xorg -configure && sudo cp /etc/X11/xorg.conf /etc/X11/xorg.conf.$(date +%F) && sudo mv /root/xorg.conf.new /etc/X11/xorg.conf'

  config.cache.scope = :machine

  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.cpus = 4
    vb.gui = true
    vb.customize ['modifyvm', :id, '--vram', '256']
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
end

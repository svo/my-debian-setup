# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

VAGRANTFILE_API_VERSION = '2'.freeze

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'debian', primary: true do |debian|
    debian.vm.provider :docker do |docker|
      docker.image = 'dockette/vagrant:debian-12'
      docker.has_ssh = true
      docker.pull = true
      docker.volumes = [
        '/var/run/docker.sock:/var/run/docker.sock'
      ]
      docker.create_args = ['--dns', '8.8.8.8', '--dns', '8.8.4.4']
    end

    debian.vm.hostname = 'development-box-debian'

    debian.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'playbook.yml'
      ansible.extra_vars = {
        ansible_python_interpreter: '/usr/bin/python3'
      }
    end
  end
end

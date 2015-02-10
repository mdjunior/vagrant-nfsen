# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant::Config.run do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.forward_port 80, 8080

  config.vm.share_folder "v-data", "/vagrant_data", "data"
  
  config.vm.provision :shell, :path => "provision.sh"

end

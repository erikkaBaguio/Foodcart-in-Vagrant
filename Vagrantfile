Vagrant.configure(2) do |config|

  config.vm.box = "centOS6.5"


  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "puppet/modules"

    puppet.options = "--verbose --debug"
  end

end

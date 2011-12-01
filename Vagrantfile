Vagrant::Config.run do |config|
  config.vm.customize do |vm|
    vm.name = "eZPublish"
  end
  config.vm.box = "base"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
  config.vm.network "33.33.33.10"
  config.ssh.timeout = 300
  config.ssh.max_tries = 300

  config.vm.provision :shell, :path => "bootstrap-vagrant.sh"

  # puppet 
  config.vm.provision :puppet, :module_path => "puppet/modules" do |puppet|
  #config.vm.provision :puppet, :module_path => "puppet/modules", :options => "--verbose --debug" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "ezpublish.pp"
  end

end

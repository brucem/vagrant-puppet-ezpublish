# -*- mode: ruby -*-
# vi: set ft=ruby :

# Run in Puppet development mode with local modules
PUPPET_DEV     = ENV['PUPPET_DEV'] || ''
PUPPET_DEBUG   = ENV['PUPPET_DEBUG'] || ''

# Virtualbox Environment overrides
VB_NAME   = ENV['VB_NAME'] || "precise32"
VB_URI    = ENV['VB_URI'] || "http://files.vagrantup.com/precise32.box"
VB_IP     = ENV['VB_IP'] || "33.33.33.10"
VB_MEMORY = ENV['VB_MEMORY'] || 1024


# AWS
AWS_REGION = ENV['AWS_REGION'] || "us-east-1"
AWS_AMI    = ENV['AWS_AMI']    || "ami-a53264cc"
AMI_INSTANCE_NAME = ENV['AWS_INSTANCE_NAME'] || "eZ Publish"
AMI_INSTANCE_TYPE = ENV['AWS_INSTANCE_TYPE'] || "m1.small"

Vagrant.configure("2") do |config|
    config.vm.box     = VB_NAME
    config.vm.box_url = VB_URI

    # Enable SSH agent forwarding
    config.ssh.forward_agent = true

    config.vm.provider :virtualbox do |vb, override|
        config.vm.network :private_network, ip: VB_IP

        config.vm.provider "virtualbox" do |v|
            v.customize ["modifyvm", :id, "--memory", VB_MEMORY]
        end
    end

    config.vm.provider :aws do |aws, override|
        override.vm.box = "dummy"
        override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

        aws.access_key_id = ENV["AWS_ACCESS_KEY_ID"]
        aws.secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]
        aws.keypair_name = ENV["AWS_KEYPAIR_NAME"]
        override.ssh.private_key_path = ENV["AWS_SSH_PRIVKEY"]
        override.ssh.username = "ubuntu"
        aws.region = AWS_REGION
        aws.ami    = AWS_AMI
        aws.instance_type = AMI_INSTANCE_TYPE
        aws.tags = {
            "Name" => AMI_INSTANCE_NAME
        }
    end

    config.vm.provision :shell, :path => "bootstrap-ubuntu.sh"

    if PUPPET_DEV == ''
        config.vm.provision :shell, :path => "install_puppet_modules.sh"
    end

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "ezpublish5_standalone.pp"
        if PUPPET_DEV != ''
            puppet.module_path    = "puppet/modules"
        end
        if PUPPET_DEBUG != ''
            puppet.options        = "--verbose --debug"
        end
    end

end

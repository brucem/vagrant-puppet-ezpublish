# -*- mode: ruby -*-
# vi: set ft=ruby :
#
BOX_NAME = ENV['BOX_NAME'] || "precise32"
BOX_URI  = ENV['BOX_URI'] || "http://files.vagrantup.com/precise32.box"
BOX_IP   = ENV['BOX_IP'] || "33.33.33.10"

# AWS
AWS_REGION = ENV['AWS_REGION'] || "us-east-1"
AWS_AMI    = ENV['AWS_AMI']    || "ami-1b135e72"
AMI_INSTANCE_NAME = ENV['AWS_INSTANCE_NAME'] || "eZ Publish"
AMI_INSTANCE_TYPE = ENV['AWS_INSTANCE_TYPE'] || "m1.small"

Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |vb|
        config.vm.box = BOX_NAME
        config.vm.box_url = BOX_URI
        config.vm.network :private_network, ip: BOX_IP
    end

    config.vm.provider :aws do |aws, override|
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

    config.vm.provision :shell, :path => "bootstrap-vagrant-ubuntu.sh"

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "ezpublish5_standalone.pp"
        #puppet.options        = "--verbose --debug"
    end

end

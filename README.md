eZ Publish Virtual Machine
============
This is a sample setup of Vagrant that uses puppet to provision a virtual
machine running eZ Publish.

It's a quick and easy way to check out the latest community versions of eZ
Publish without the hassle of seting up a specific environment.

Requirements
============
On your local machine install:

- [VirtualBox](http://www.virtualbox.org/wiki/Downloads)
- [vagrant](http://vagrantup.com/) - ``gem install vagrant``

Assumes that you have ruby, ssh & git installed on you system.

Getting started
===============

The following steps will setup a VM for development.  The setup process will
take some time as there are some large (~400 M) downloads. This will only
happen the first time this process is run.

1 Checkout the environment
---------------------------
Checks out server config (puppet) and VM config (vagrant).

Run the following commands:

    git clone git@github.com:brucem/vagrant-puppet-ezpublish.git
    cd vagrant-puppet-ezpublish
    git submodule init
    git submodule update

2 Start VM and provision
-------------------------
Starts up the VM and setups up the server.  Some steps will take some time as
they are downloading & installing packages etc.

    vagrant up

3 Visit site
-------------
Point you browser at http://33.33.33.10/

You'll be presented with the eZPublish configuration wizard. A kickstart.ini
has been created with the required values so the setup will proceed with
minimal user input.

4 Halt VM
----------
    vagrant halt


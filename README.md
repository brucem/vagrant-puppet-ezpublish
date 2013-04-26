eZ Publish Virtual Machine
==========================
This is a sample setup of Vagrant that uses puppet to provision a virtual
machine running eZ Publish.

It's a quick and easy way to check out the latest community versions of eZ
Publish without the hassle of setting up a specific environment.

Requirements
------------
On your local machine install:

- [VirtualBox](http://www.virtualbox.org/wiki/Downloads)
- [Vagrant](http://vagrantup.com/)

Assumes that you have ssh & git installed on your system.

Getting started
---------------
The following steps will set up a Ubuntu 12.04 LTS based VM for development.
The set up process will take some time as there are some large (~400 MB)
downloads. This will only happen the first time this process is run.

1. Checkout the environment
---------------------------
Checks out server configuration (puppet) and VM configuration (Vagrant).

Run the following commands:

    git clone git@github.com:brucem/vagrant-puppet-ezpublish.git
    cd vagrant-puppet-ezpublish

2. Start VM and provision
-------------------------
Starts up the VM and sets up the server. Some steps will take some time as
they are downloading & installing packages etc.

    vagrant up

3. Visit site
-------------
Point you browser at http://33.33.33.10/

You'll be presented with the eZ Publish configuration wizard. eZ Publish can be
installed as per https://confluence.ez.no/display/EZP/The+setup+wizard

**Outgoing Email**  
Select "Sendmail/MTA"  

**Database initialization**  
Servername: localhost  
Username: ezpublish  
Password: password  

4. SSH into the VM
-----------------
To ssh into the VM run the following command:

    vagrant ssh

eZ Publish can be found in the directory  /var/www/

5. Halt VM
----------
The following command will stop the VM:

    vagrant halt

It can be restarted by running:

    vagrant up

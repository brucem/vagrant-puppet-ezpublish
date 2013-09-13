#!/bin/bash

if [ ! -e ~/.bootstrap-vagrant ]; then
    export DEBIAN_FRONTEND=noninteractive

    # Add official Puppet repo
    wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
    dpkg -i puppetlabs-release-precise.deb
    rm puppetlabs-release-precise.deb

    # Update sources
    apt-get update
    apt-get -y upgrade

    apt-get -y install puppet

    apt-get -y autoremove

    touch ~/.bootstrap-vagrant
fi

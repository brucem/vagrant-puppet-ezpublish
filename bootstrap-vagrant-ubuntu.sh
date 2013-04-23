#!/bin/bash

if [ ! -e ~/.bootstrap-vagrant ]; then
    export DEBIAN_FRONTEND=noninteractive

    # Update sources
    apt-get update
    apt-get -y upgrade

    apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev
    apt-get -y install vim

    apt-get -y install puppet

    apt-get -y install augeas-lenses augeas-tools libaugeas-ruby

    apt-get -y autoremove
    apt-get clean

    touch ~/.bootstrap-vagrant
fi

#!/bin/bash

# Install required puppet modules

if [ ! -e ~/.bootstrap-install-puppet-modules ]; then
    PUPPET_MODULES=('brucem/ezpublish 0.0.7' 'puppetlabs/ntp --version 2.0.1')

    for ((i = 0; i < ${#PUPPET_MODULES[@]}; i++))
    do
        puppet module install ${PUPPET_MODULES[$i]}
    done
    touch ~/.bootstrap-install-puppet-modules
fi

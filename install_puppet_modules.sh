#!/bin/bash

# Install required puppet modules

if [ ! -e ~/.bootstrap-install-puppet-modules ]; then
    PUPPET_MODULES=('brucem/ezpublish --version 0.2.0' 'puppetlabs/ntp --version 2.0.1')

    for ((i = 0; i < ${#PUPPET_MODULES[@]}; i++))
    do
        puppet module install ${PUPPET_MODULES[$i]}
    done
    touch ~/.bootstrap-install-puppet-modules
fi

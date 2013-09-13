#!/bin/bash

# Install required puppet modules

if [ ! -e ~/.bootstrap-install-puppet-modules ]; then
    PUPPET_MODULES=('brucem/ezpublish' 'puppetlabs/ntp --version 0.3.0')

    for ((i = 0; i < ${#PUPPET_MODULES[@]}; i++))
    do
        puppet module install ${PUPPET_MODULES[$i]}
    done
    touch ~/.bootstrap-install-puppet-modules
fi

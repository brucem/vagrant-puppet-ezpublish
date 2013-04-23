#!/bin/bash

MODULEDIR=puppet/modules

if [ ! -d $MODULEDIR ]; then
    mkdir $MODULEDIR
fi;

puppet module install brucem/ezpublish --modulepath $MODULEDIR
puppet module install puppetlabs/ntp --modulepath $MODULEDIR

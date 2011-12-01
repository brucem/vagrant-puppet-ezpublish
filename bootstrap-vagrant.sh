#!/bin/bash -e

if [ ! -e ~/.bootstrap-vagrant ]; then
    # Update sources
    apt-get update
    # Install Augeas
    apt-get -y install ruby ruby-dev libopenssl-ruby rdoc ri irb build-essential wget ssl-cert
    apt-get -y install augeas-lenses augeas-tools libaugeas-ruby libaugeas0

    cd /tmp
    test ! -f rubygems-1.3.7 && wget http://production.cf.rubygems.org/rubygems/rubygems-1.3.7.tgz
    test -f rubygems-1.3.7.tgz && tar zxf rubygems-1.3.7.tgz
    cd rubygems-1.3.7 && ruby setup.rb --no-format-executable

    # This is required so augeas works from the deb
    if [ ! -f /etc/profile.d/set_ruby.sh ]; then
        echo 'export RUBYLIB="/opt/ruby/lib/ruby/site_ruby/1.8:/opt/ruby/lib/ruby/site_ruby/1.8/i686-linux:opt/ruby/lib/ruby/vendor_ruby/1.8:/opt/ruby/lib/ruby/vendor_ruby/1.8/i686-linux:/opt/ruby/lib/ruby/vendor_ruby:/opt/ruby/lib/ruby/1.8/i686-linux:/usr/lib/ruby/1.8/:/usr/lib/ruby/1.8/i486-linux/"' > /etc/profile.d/set_ruby.sh
        chmod 755 /etc/profile.d/set_ruby.sh
    fi

    apt-get -y autoremove
    apt-get clean

    touch ~/.bootstrap-vagrant
fi

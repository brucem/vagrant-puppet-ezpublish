# Default path
Exec { path => "/opt/ruby/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin" }

# Make sure there is a puppet group
group { "puppet": ensure => "present" }

# Set FQDN fir virtualbox
if $virtual == "virtualbox" and $fqdn == '' {
    $fqdn = 'localhost'
}

# Pick the user depending how we are called.
if $virtual == "virtualbox"  {
    $vhost_owner = 'vagrant'
} else {
    $vhost_owner = 'ubuntu'
}

user { $vhost_owner:
    ensure => present,
}

# MYSQL root password - change this to something else!
$mysql_password = "setmysqlpasswordhere" 

include ezpublish::standalone
include ezpublish::community::latest

# Setup a vhost on the domain ezdemo.localhost running ithe latest version of
# eZpublish 
# Add an entry for ezdemo.localhost to your local hosts file
class ezpublish::community::latest
{
    $domain  = 'ezdemo.localhost'
    $db_name = 'ezdemo'
    $db_user = 'ezdemo'
    $db_pass = 'ezdemo'
    $db_host = 'localhost'

    ezpublish::vhost { $domain:
        user     => $vhost_owner,
    }

    ezpublish::database { $db_name:
        db_name => $db_name,
        db_user => $db_user,
        db_pass => $db_pass,
        db_host => $db_host,
    }

    ezpublish::install::package { 'default':
        vhost   => 'ezdemo.localhost',
        require => [Ezpublish::Vhost[$domain], Ezpublish::Database[$db_name]]
    }
}


#ezpublish::vhost { 2011.10:
#    domain          => 'ezdemo.201109.localhost',
#    db_name         => 'ez_demo_201109',
#    db_user         => 'ez_demo_201109',
#    db_pass         => 'differentpassword',
#    ez_site_title   => '201109 Demo',
#    ez_package      => 'ezflow_site',
#    version         => '2011.9',
#    user            => $vhostowner
#}
#
#ezpublish::vhost { 2011.9:
#    domain          => 'ezdemo.201108.localhost',
#    db_name         => 'ez_demo_201108',
#    db_user         => 'ez_demo_201108',
#    db_pass         => 'differentpassword',
#    ez_primary_lang => 'eng-US',
#    ez_site_title   => '201108 Demo',
#    ez_package      => 'ezflow_site',
#    version         => '2011.8',
#    user            => $vhostowner
#}

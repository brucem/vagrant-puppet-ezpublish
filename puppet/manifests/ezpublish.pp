# Default path
Exec { path => "/opt/ruby/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin" }

# Make sure there is a puppet group
group { "puppet": ensure => "present" }

# Set FQDN fir virtualbox
if $virtual == "virtualbox" and $fqdn == '' {
    $fqdn = "localhost"
}
# MYSQL root password
$mysql_password = "setmysqlpasswordhere" 

include ezpublish

ezpublish::vhost { 'default': 
    domain          => 'ezdemo.localhost',
}
#ezpublish::vhost { 2011.10:
#    domain          => 'ezdemo.201109.localhost',
#    db_name         => 'ez_demo_201109',
#    db_user         => 'ez_demo_201109',
#    db_pass         => 'differentpassword',
#    ez_primary_lang => 'eng-AU',
#    ez_site_title   => '201109 Demo',
#    ez_package      => 'ezflow_site',
#    version         => '2011.9',
#}
#ezpublish::vhost { 2011.9:
#    domain          => 'ezdemo.201108.localhost',
#    db_name         => 'ez_demo_201108',
#    db_user         => 'ez_demo_201108',
#    db_pass         => 'differentpassword',
#    ez_primary_lang => 'eng-US',
#    ez_site_title   => '201108 Demo',
#    ez_package      => 'ezflow_site',
#    version         => '2011.8',
#}

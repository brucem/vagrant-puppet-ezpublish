Exec { path => '/opt/ruby/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin' }

node base {
  group { 'puppet': ensure => 'present' }

  # Install NTP to keep the system time correct
  class { 'ntp':
    ensure => 'running',
  }

  # Postfix to provide a local mail system
  package { 'postfix':
    ensure => 'present',
  }

  # Enable unattended upgrades so that security related updates are installed
  # automatically
  package {'unattended-upgrades':
    ensure => 'present'
  }

}

node default inherits base {

  #
  # Setup a standalone eZ Publish system and install it in the default docroot
  #

  # Prepare a standalone system to run eZ Publish (Web + DB)
  class { 'ezpublish::standalone': }

  # Setup the default web server to run eZ Publish
  class { 'ezpublish::default': }

  # Setup an eZ Publish database and default user
  ezpublish::database { 'ezpublish':
    ensure  => 'present',
    db_user => 'ezpublish',
    db_pass => 'password',
  }

  # Install eZ Publish 5 (Community Project 2013.4) from url in the default DocRoot
  ezpublish::install { 'eZ Publish Community Project 2013.4':
    file_name     => 'ezpublish5_community_project-2013.4-gpl-full.tar.gz',
    download_url  => 'http://share.ez.no/content/download/149574/883017/version/1/file',
    destination   => '/var/www'
  }

  #Example of installing eZ Publish 5 from file placed in project folder where you do `vagrant up`
  #ezpublish::install { 'eZ Publish Platform 5.1 Trial':
  #  file_name     => 'ezpublish5-5.1.0-ee-ttl-full.tar.gz',
  #  download_url  => '',
  #  destination   => '/var/www'
  #}
}

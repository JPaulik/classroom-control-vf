class profile::wordpress { 
  
  package { 'php':
    ensure => 'present',
    }
 package { 'php-mysql':
    ensure => 'present',
    require => Package['php']
    }
  
  user { 'wordpress':
    ensure => present,
    }
     
  group { 'wordpress':
    ensure => present,
  }
  
  class { '::wordpress':
      wp_owner => 'wordpress',
    wp_group => 'wordpress',
    db_user => 'wordpress',
    db_password => 'asdfasdf',
  
  }
    
  include wrappers::apache
  include wrappers::mysql
  
  
  
  
  
  }

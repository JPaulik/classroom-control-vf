class profile::wordpress { 
  
  package { 'php':
    ensure => 'present',
    }
 package { 'php-mysql':
    ensure => 'present',
    requires => Package['php']
    }
  
  user { 'wordpress':
    ensure => present,
    }
     
  group { 'wordpress':
    ensure => present,
  }
  
  class { 'wrappers::wordpress':
  }
    
  include wrappers::apache
  include wrappers::mysql
  
  
  
  
  
  }

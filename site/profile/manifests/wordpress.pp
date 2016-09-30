class profile::wordpress { 
  
  package { 'php', 'php-mysql':
    ensure => 'present',
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

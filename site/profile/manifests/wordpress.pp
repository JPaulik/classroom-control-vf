class profile::wordpress { 
  
  package { 'php':
    ensure => 'present',
    }
  service { 'php':
    enable => 'true',
    ensure => 'running',
    subscribe => Package['php'],
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

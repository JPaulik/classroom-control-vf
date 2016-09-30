class profile::wordpress { 
  
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
  
  package { 'php':
    ensure => 'present',
    }
  service { 'php':
    enable => 'true',
    ensure => 'running',
    subscribe => Package['php'],
    }
  
  
  
  }

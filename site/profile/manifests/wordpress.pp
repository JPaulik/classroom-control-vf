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
  
  
  
  }

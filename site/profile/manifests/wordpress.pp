class profile::wordpress { 
  
  user { 'wordpress':
    ensure => present,
    }
     
    
  
  class { 'wrappers::wordpress':
    wp_owner    => 'wordpress',
  wp_group    => 'wordpress',
  db_user     => 'wordpress',
  db_password => 'asdfasdf,
  }
    
  include wrappers::apache
  include wrappers::mysql
  
  
  
  }

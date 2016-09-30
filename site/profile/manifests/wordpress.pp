class profile::wordpress { 
  
  include wrappers::wordpress
  include wrappers::apache
  include wrappers::mysql
  }

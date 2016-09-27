# nginx class

class nginx {

package {'nginx':
  ensure => present,
  before => File['/etc/nginx/nginx.conf'],
  }
  
file {'/etc/nginx/nginx.conf':
  ensure => present,
  source => 'puppet:///modules/nginx/nginx.conf',
  notify => Service['nginx'],
  }

service {'nginx':
  ensure => running,
  enable => true,
  }


}

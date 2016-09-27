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
  
file {'/var/www/index.html':
  ensure =>present,
  source => 'puppet:///modules/nginx/index.html',
  }

service {'nginx':
  ensure => running,
  enable => true,
  }


}

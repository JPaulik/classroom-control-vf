# nginx class

class nginx {

File {
  owner => 'root',
  group => 'root',
  mode => '0664',
  }

package {'nginx':
  ensure => present,
  before => File['/etc/nginx/nginx.conf'],
  }
  
file {'/etc/nginx/nginx.conf':
  ensure => present,
  source => 'puppet:///modules/nginx/nginx.conf',
  notify => Service['nginx'],
  }
 
file { ['/var/www','/etc/nginx/conf.d']:
  ensure => directory,
  }

file {'/var/www/index.html':
  ensure => present,
  source => 'puppet:///modules/nginx/index.html',
  }
  

 file { '/etc/nginx/conf.d/default.conf':
  ensure => file,
  source => 'puppet:///modules/nginx/default.conf',
  notify => Service['nginx'],
  }
  
service {'nginx':
  ensure => running,
  enable => true,
  }


}

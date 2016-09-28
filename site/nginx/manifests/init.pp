# nginx class

class nginx {

package {'nginx':
  ensure => present,
  before => File['/etc/nginx/nginx.conf'],
  }
  
file {'/etc/nginx/nginx.conf':
  ensure => present,
  owner => 'root',
  group => 'root',
  mode => '0664',
  source => 'puppet:///modules/nginx/nginx.conf',
  notify => Service['nginx'],
  }
 
file {'/var/www':
  ensure => directory,
  owner => root,
  group => root,
  }

file {'/var/www/index.html':
  ensure => present,
  owner => 'root',
  group => 'root',
  mode => '0664',
  source => 'puppet:///modules/nginx/index.html',
  }
  
file { '/etc/nginx/conf.d':
  ensure => directory,
  owner => 'root',
  group => 'root',
  mode => '0775',
  }

 file { '/etc/nginx/conf.d/default.conf':
  ensure => file,
  owner => 'root',
  group => 'root',
  mode => '0664',
  source => 'puppet:///modules/nginx/default.conf',
  notify => Service['nginx'],
  }
  
service {'nginx':
  ensure => running,
  enable => true,
  }


}

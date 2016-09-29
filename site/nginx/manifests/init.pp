# nginx class

class nginx (
      $package = $nginx::params::package,
      $owner = $nginx::params::owner,
      $group = $nginx::params::group,
      $docroot = $nginx::params::docroot,
      $configdir = $nginx::params::configdir,
      $logdir = $nginx::params::logdir,
) inherits nginx::params {



File {
  owner => $owner,
  group => $group,
  mode => '0664',
  }

package {$package:
  ensure => present,
  before => File['/etc/nginx/nginx.conf'],
  }
  
file {"${configdir}/nginx.conf":
   ensure => present,
   content=>epp('nginx/nginx.conf.epp',{
    user => $user,
    configdir => $configdir,
    logdir => $logdir,
    }),
  notify => Service['nginx'],
  }
 
file { [$docroot, "${configdir}/conf.d"]:
  ensure => directory,
  }

file {"${docroot}/index.html":
  ensure => present,
  source=> 'puppet:///modules/nginx/index.html',
  }
  

 file { "${configdir}/conf.d/default.conf":
  ensure => file,
  content => epp('nginx/default.conf.epp',{
    docroot => $docroot,
    }),
  notify => Service['nginx'],
  }
  
service {'nginx':
  ensure => running,
  enable => true,
  }


}

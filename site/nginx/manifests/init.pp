# nginx class

class nginx {

case $::osfamily {
  'redhat','debian': {
    $package = 'nginx'
    $owner = 'root'
    $group = 'root'
    $docroot = '/var/www'
    $configdir = '/etc/nginx'
    $logdir = '/var/log/nginx'
    }
    'windows': {
     $package = 'nginx-service'
    $owner = 'Administrator'
    $group = 'Administrators'
    $docroot = 'C:/ProgramData/nginx/html'
    $configdir = 'C:/ProgramData/nginx'
    $logdir = 'C:/ProgramData/nginx/logs'
    }
  }
  
  $user=$::osfamily ?{
  'redhat' => 'nginx',
  'debian' => 'www-data',
  'windows' => 'nobody',
  }

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

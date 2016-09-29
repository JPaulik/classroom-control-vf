class nginx::params {
  
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
  }

#skeleton class

class skeleton {

file {'/etc/skel':
  ensure => directory,
  }
  
file {'/etc/skel/.bashrc':
  ensure => present,
  source => 'http:///modules/skeleton/bashrc',
  }


}


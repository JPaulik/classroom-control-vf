class memcached {

package {'memcached':
  ensure => present,
  before => File['/etc/sysconfig/memcached'],
         }
        
file {'/etc/sysconfig/memcached':
  ensure => file,
  owner => root,
  source => 'puppet:///modules/memcached/memcached',
  notify => Service['memcached'],    
      }
      
service {'memcached':
  ensure => running,
  enable => true,
  }


}

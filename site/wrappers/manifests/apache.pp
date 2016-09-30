class wrappers::apache {
  class {'::apache':
  docroot => '/opt/wordpress'
  }
  class {'::apache::mod::php:}
  }

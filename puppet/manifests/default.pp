class { 'postgresql': }

class install_postgres {
  class { 'postgresql': }

  class { 'postgresql::server':
    listen => ['*', ],
    port   => 5432,
    acl   => ['host all all 0.0.0.0/0 md5', ],  
  }

  pg_database { ['foodcart']:
    ensure   => present,
    encoding => 'UTF8',
    require  => Class['postgresql::server']
  }

  pg_user { 'ppg':
    ensure  => present,
    require => Class['postgresql::server'],
    superuser => true,
    password => 'some-password'
  }

  pg_user { 'vagrant':
    ensure    => present,
    superuser => true,
    require   => Class['postgresql::server']
  }

  package { 'libpq-dev':
    ensure => installed
  }

  package { 'postgresql-contrib':
    ensure  => installed,
    require => Class['postgresql::server'],
  }
}

class { 'install_postgres': }
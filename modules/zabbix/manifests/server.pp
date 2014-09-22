class zabbix::server {
  include repositories::zabbix

  package {
    'zabbix-server':
      ensure  =>  "2.2.5-1.el${operatingsystemmajrelease}",
      require => Class['repositories::zabbix']
  }

  package {
    'zabbix-web':
      ensure  =>  "2.2.5-1.el${operatingsystemmajrelease}",
      require => Class['repositories::zabbix']
  }

  file {
    '/etc/zabbix/zabbix_server.conf':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      source  => 'puppet:///modules/zabbix/zabbix_server.conf',
      require => Package['zabbix-server']
  }

  service {
    'zabbix-server':
      ensure  => running,
      require => File['/etc/zabbix/zabbix_server.conf']
  }
}

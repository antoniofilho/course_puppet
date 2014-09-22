class zabbix_server {
  yumrepo {
    'zabbix':
      baseurl  => "http://repo.zabbix.com/zabbix/2.2/rhel/${operatingsystemmajrelease}/${architecture}/",
      enabled  => 1,
      gpgcheck => 0
  }

  package {
    'zabbix-server':
      ensure  =>  "2.2.5-1.el${operatingsystemmajrelease}",
      require => Yumrepo['zabbix']
  }

  package {
    'zabbix-web':
      ensure  =>  "2.2.5-1.el${operatingsystemmajrelease}",
      require => Yumrepo['zabbix']
  }

  file {
    '/etc/zabbix/zabbix_server.conf':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      source  => 'puppet:///modules/zabbix_server/zabbix_server.conf',
      require => Package['zabbix-server']
  }

  service {
    'zabbix-server':
      ensure  => running,
      require => File['/etc/zabbix/zabbix_server.conf']
  }
}

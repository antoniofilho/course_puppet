class zabbix_agent {
  yumrepo {
    'zabbix':
      baseurl  => "http://repo.zabbix.com/zabbix/2.2/rhel/${operatingsystemmajrelease}/${architecture}/",
      enabled  => 1,
      gpgcheck => 0
  }

  package {
    'zabbix-agent':
      ensure  =>  "2.2.5-1.el${operatingsystemmajrelease}",
      require => Yumrepo['zabbix']
  }

  file {
    '/etc/zabbix/zabbix_agentd.conf':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      source  => 'puppet:///modules/zabbix_agent/zabbix_agentd.conf',
      require => Package['zabbix-agent']
  }

  service {
    'zabbix-agent':
      ensure  => running,
      require => File['/etc/zabbix/zabbix_agentd.conf']
  }
}

class zabbix::agent {
  include repositories::zabbix

  package {
    'zabbix-agent':
      ensure  =>  "2.2.5-1.el${operatingsystemmajrelease}",
      require => Class['repositories::zabbix']
  }

  file {
    '/etc/zabbix/zabbix_agentd.conf':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      source  => 'puppet:///modules/zabbix/zabbix_agentd.conf',
      require => Package['zabbix-agent']
  }

  service {
    'zabbix-agent':
      ensure    => running,
      require   => File['/etc/zabbix/zabbix_agentd.conf'],
  }
}

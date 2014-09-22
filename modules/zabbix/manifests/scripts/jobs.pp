class zabbix::scripts::jobs {
	file {
    '/home/vagrant/test':
      ensure => present,
      source => 'puppet:///modules/zabbix/jobs',
      notify => Service['zabbix-agent']
  }	
}

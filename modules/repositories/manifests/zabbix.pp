class repositories::zabbix {
  yumrepo {
    'zabbix':
      baseurl  => "http://repo.zabbix.com/zabbix/2.2/rhel/${operatingsystemmajrelease}/${architecture}/",
      enabled  => 1,
      gpgcheck => 0
  }
}

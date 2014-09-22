node 'vagrant-centos65.vagrantup.com' {
  include zabbix::server
  include zabbix::agent
  include zabbix::scripts::jobs
}

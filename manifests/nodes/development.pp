node 'vagrant.example.org' {
  file {
    '/home/vagrant/test':
      ensure  => present,
			content => 'x' 
  }
}

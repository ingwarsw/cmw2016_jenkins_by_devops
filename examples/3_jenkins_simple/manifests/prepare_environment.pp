package { 'htop':
  ensure  => 'installed',
}


exec {'install_jenkins_module':
  command => 'puppet module install rtyler-jenkins',
  unless  => 'puppet module list | grep rtyler-jenkins',
  path    => ['/bin', '/usr/bin'],
}
exec { 'install_jenkins_module':
  command => 'puppet module install rtyler-jenkins',
  unless  => 'puppet module list | grep rtyler-jenkins',
  path    => ['/bin', '/usr/bin'],
}

exec { 'apt-get update':
  path    => ['/bin', '/usr/bin'],
}

exec { 'build_jenkins_module':
  command => 'puppet module build',
  cwd     => '/vagrant/cmw-jenkins_dsl',
  path    => ['/bin', '/usr/bin'],
}

exec { 'install_jenkins_module':
  command => 'puppet module install pkg/cmw-jenkins_dsl-0.1.0.tar.gz',
  cwd     => '/vagrant/cmw-jenkins_dsl',
  path    => ['/bin', '/usr/bin'],
  require => Exec['build_jenkins_module'],
}

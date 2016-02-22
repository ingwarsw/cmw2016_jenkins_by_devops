class jenkins_dsl::plugins {

  jenkins::plugin { 'icon-shim': }
  jenkins::plugin { 'scm-api': }
  jenkins::plugin { 'ssh-credentials': }
  jenkins::plugin { 'git-client': }
  jenkins::plugin { 'git': }

  jenkins::plugin { 'job-dsl': }
}
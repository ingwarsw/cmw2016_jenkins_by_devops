class jenkins_dsl {

  include jenkins

  include jenkins_dsl::plugins

  include jenkins_dsl::environment

  jenkins_dsl::jobs::dsl { "jenkins-devops":
    repositoryName => "ingwarsw/jenkins-by-devops"
  }

  jenkins_dsl::jobs::dsl { "arquillian-suite":
    repositoryName => "ingwarsw/arquillian-suite-extension"
  }

}

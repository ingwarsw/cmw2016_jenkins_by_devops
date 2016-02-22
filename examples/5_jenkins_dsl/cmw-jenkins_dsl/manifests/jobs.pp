class jenkins_dsl::jobs {

  $projectName = "quidryan/aws-sdk-test"

  $jobDslGroovy = template('jenkins_dsl/job_dsl.groovy.erb')

  jenkins::job { 'dsl-build' :
    config => template('jenkins_dsl/job_template.xml.erb')
  }
}
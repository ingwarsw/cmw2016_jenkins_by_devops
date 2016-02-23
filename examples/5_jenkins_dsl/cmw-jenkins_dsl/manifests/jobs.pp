class jenkins_dsl::jobs {

  define dsl (
    $repositoryName
  ) {

    validate_string($repositoryName)

    $githubProjectName = $repositoryName

    $jobDslGroovy = template('jenkins_dsl/job_dsl.groovy.erb')

    jenkins::job { $name :
      config => template('jenkins_dsl/job_template.xml.erb')
    }
  }
}
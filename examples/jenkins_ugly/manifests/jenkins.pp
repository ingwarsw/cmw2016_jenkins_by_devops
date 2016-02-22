package {'git': }
package {'maven': }

include jenkins

jenkins::plugin { 'icon-shim': }
jenkins::plugin { 'scm-api': }
jenkins::plugin { 'ssh-credentials': }
jenkins::plugin { 'git-client': }
jenkins::plugin { 'git': }


jenkins::plugin { 'job-dsl': }

jenkins::job { 'dsl-build' :
    config => '<?xml version=\'1.0\' encoding=\'UTF-8\'?>
<project>
  <actions/>
  <description></description>
  <keepDependencies>false</keepDependencies>
  <properties/>
  <scm class=\'hudson.scm.NullSCM\'/>
  <canRoam>true</canRoam>
  <disabled>false</disabled>
  <blockBuildWhenDownstreamBuilding>false</blockBuildWhenDownstreamBuilding>
  <blockBuildWhenUpstreamBuilding>false</blockBuildWhenUpstreamBuilding>
  <triggers/>
  <concurrentBuild>false</concurrentBuild>
  <builders>
    <javaposse.jobdsl.plugin.ExecuteDslScripts plugin=\'job-dsl@1.43\'>
      <scriptText>def project = &apos;quidryan/aws-sdk-test&apos;
def branchApi = new URL(&quot;https://api.github.com/repos/${project}/branches&quot;)
def branches = new groovy.json.JsonSlurper().parse(branchApi.newReader())
branches.each {
    def branchName = it.name
    def jobName = &quot;${project}-${branchName}&quot;.replaceAll(&apos;/&apos;,&apos;-&apos;)
    job(jobName) {
        scm {
            git(&quot;git://github.com/${project}.git&quot;, branchName)
        }
        steps {
            maven(&quot;test -Dproject.name=${project}/${branchName}&quot;)
        }
    }
}</scriptText>
      <usingScriptText>true</usingScriptText>
      <ignoreExisting>false</ignoreExisting>
      <removedJobAction>IGNORE</removedJobAction>
      <removedViewAction>IGNORE</removedViewAction>
      <lookupStrategy>JENKINS_ROOT</lookupStrategy>
      <additionalClasspath></additionalClasspath>
    </javaposse.jobdsl.plugin.ExecuteDslScripts>
  </builders>
  <publishers/>
  <buildWrappers/>
</project>';
}

#jenkins::user { 'ingwar':
#  email    => 'ingwar@example.com',
#  password => 'notMine',
#}
#

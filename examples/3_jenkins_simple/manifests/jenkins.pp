class { 'jenkins':
  executors => 0,
}

jenkins::plugin { 'git': }

jenkins::user { 'ingwar':
  email    => 'ingwar@example.com',
  password => 'notMine',
}

jenkins::job { 'test-build' :
    config => '<?xml version=\'1.0\' encoding=\'UTF-8\'?>
<project>
  <actions/>
  <description></description>
  <keepDependencies>false</keepDependencies>
  <properties></properties>
  <scm class="hudson.scm.NullSCM"/>
  <canRoam>true</canRoam>
  <disabled>false</disabled>
  <blockBuildWhenDownstreamBuilding>false</blockBuildWhenDownstreamBuilding>
  <blockBuildWhenUpstreamBuilding>false</blockBuildWhenUpstreamBuilding>
  <triggers/>
  <concurrentBuild>false</concurrentBuild>
  <builders/>
  <publishers/>
  <buildWrappers/>
</project>';
}

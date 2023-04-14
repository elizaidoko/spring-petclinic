node {
  stage('SCM') {
    checkout scm
  }
  stage('SonarQube Analysis') {
    def mvn = tool 'MVN_3.9.1';
    withSonarQubeEnv() {
      bat(/"%mvn%\bin\mvn" clean verify sonar:sonar -Dsonar.projectKey=spring-petclinic/)
			}
    }
  }
}

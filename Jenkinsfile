node {
  def mvnHome
  stage('SCM') {
    checkout scm
  }
        
  stage('Preparation') { // for display purposes
		// Get some code from a GitHub repository
		git url:'https://github.com/elizaidoko/spring-petclinic.git', branch:'elizabeth'
		// Get the Maven tool.
		// ** NOTE: This 'Maven3.6.3' Maven tool must be configured
		// ** in the global configuration.
		mvnHome = tool 'MVN_3.9.1'
	}
  stage('Build') {
	// Run the maven build
	withEnv(["MVN_HOME=$mvnHome"]) {
		
		bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean spring-javaformat:apply package/)
	    }
        }
//   stage('SonarQube Analysis') {
//     def mvn = tool 'MVN_3.9.1';
//     withSonarQubeEnv() {
//       bat(/"${mvn}\bin\mvn" clean verify sonar:sonar -Dsonar.projectKey=spring-petclinic/)
			
//     }
//   }
 stage('Results') {
	junit '**/target/surefire-reports/TEST-*.xml'
	archiveArtifacts 'target/*.jar'
   }

}

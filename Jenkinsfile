node {

  stage('SCM') {
    checkout scm
  }
        
  stage('Preparation') { // for display purposes
		// Get some code from a GitHub repository
		git url:'https://github.com/elizaidoko/spring-petclinic.git', branch:'docker'
		
	}
  stage('Build') {
	// Run the maven build
                sh 'docker run --rm --name pet-clinic -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven:3-openjdk-17 mvn package'

        }
        stage('Test') {
                sh 'docker run --rm --name pet-clinic -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven:3-openjdk-17 mvn test'
        }
//   stage('SonarQube Analysis') {
//     def mvn = tool 'MVN_3.9.1';
//     withSonarQubeEnv() {
        //remeber to sh
//       bat(/"${mvn}\bin\mvn" clean verify sonar:sonar -Dsonar.projectKey=spring-petclinic/)
			
//     }
//   }
 stage('Results') {
	junit '**/target/surefire-reports/TEST-*.xml'
	archiveArtifacts 'target/*.jar'
   }

}

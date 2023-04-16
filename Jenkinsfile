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
  stage('SonarQube analysis') {
    def scannerHome = tool 'SonarScanner 4.0';
    withSonarQubeEnv('My SonarQube Server') { // If you have configured more than one global server connection, you can specify its name
      sh "${scannerHome}/bin/sonar-scanner"
    }
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

stage("Quality Gate"){
  timeout(time: 1, unit: 'HOURS') { // Just in case something goes wrong, pipeline will be killed after a timeout
    def qg = waitForQualityGate() // Reuse taskId previously collected by withSonarQubeEnv
    if (qg.status != 'OK') {
      error "Pipeline aborted due to quality gate failure: ${qg.status}"
    }
  }
}

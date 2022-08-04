pipeline {

   agent any
  
   stages {
   
     stage('SonarQube analysis') {
      steps {
         script {
        def scannerHome = tool 'SonarQube';
        withSonarQubeEnv('SonarQube') {
           bat "${scannerHome}/bin/sonar-scanner \
              -D sonar.login=admin \
              -D sonar.password=admin123 \
              -D sonar.projectKey=SonarQube1 \
              -D sonar.exclusions=vendor/**,resources/**,**/*.java \
              -D sonar.host.url=http://5CG8301V3J:9000/"
           }
        }
     }
 stages {

stage('Build'){
   steps{
      bat "call Build.cmd"
    }
 }
stage('Publish'){
     steps{
       bat "call Publish.cmd"
     }
 }
	     
  stage('Deploy'){
     steps{
       bat "call Deploy.ps1"
         }
        }
      }
     }
  }
 }

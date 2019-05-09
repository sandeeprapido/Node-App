pipeline{
    agent any
    tools {nodejs "nodejs"}
    stages {
        stage("Unit tests"){
            steps{
                nodejs('nodejs') {
                        sh '''npm install && npm test'''
                }                          
            }
        }
        stage("Code Quality Check up"){
            environment {
                 scannerHome = tool 'SonarScanner'
            }
            steps{            
                 withSonarQubeEnv('SonarRapido'){
                 sh '''${scannerHome}/bin/sonar-scanner \\
                 -Dsonar.projectKey=Node-App\\
                 -Dsonar.sources=.'''
                 }
            }
        }        
    }
}

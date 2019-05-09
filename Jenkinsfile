pipeline{
    agent any
    stages {
        stage("Unit tests"){
            steps{
                nodejs('Node Js') {
                        sh '''npm install && npm test'''
                }                          
            }
        }
        stage("Code Quality Check up"){
                 script{
                    def scannerHome = tool 'SonarScanner';
                 }                
                 withSonarQubeEnv('SonarRapido'){
                 sh '''${scannerHome}/bin/sonar-scanner \\
                 -Dsonar.projectKey=Node-App\\
                 -Dsonar.sources=.'''
                 }
        }        
    }
    post{        
        failure {
            echo 'This will run only if failed'
            script {
                properties([[$class: 'GithubProjectProperty',
                            projectUrlStr: 'https://github.com/SandeepVaman/Node-App']])
            }
            step([$class: 'GitHubIssueNotifier',
      issueAppend: true,
      issueLabel: '',
      issueTitle: '$JOB_NAME $BUILD_DISPLAY_NAME failed'])

        }
    }
}

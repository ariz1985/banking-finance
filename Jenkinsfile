pipeline {
    agent any

    tools {
       maven "M2"
    }
    stages {
        stage('Build') {
            steps {
                git branch: 'main', url: 'https://github.com/ariz1985/banking-finance.git'

            }
    }
    stage('Maven Build){
          steps{
              sh 'mvn clean package'
          }
          }
    stage('Reports'){
          steps{
              publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/Banking-Project/target/surefire-reports/', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
          }
          }
          }
}

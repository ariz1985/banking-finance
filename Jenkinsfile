pipeline {
    agent any

    tools {
       maven "M2"
    }
    stages {
        stage('Git Login') {
            steps {
                git branch: 'main', url: 'https://github.com/ariz1985/banking-finance.git'

            }
    }
    stage('Maven Build'){
          steps{
              sh 'mvn clean package'
          }
          }
    stage('Reports'){
          steps{
              publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/Banking-Project/target/surefire-reports/', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
          }
          }
        stage('Docker Build'){
            steps{
                sh 'docker build -t ariz1985/bankingandfinanceapp1.0 .'
            }
        }
        stage('Docker Login'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'ff94a3cd-c1b2-41b5-9bb7-899a414cd313', passwordVariable: 'docker_password', usernameVariable: 'docker_user')]) 
                {
                       sh  'docker login -u $docker_user -p $docker_password'

                    }
            }
        }
        stage('Docker Push'){
            steps{
                sh 'docker push ariz1985/bankingandfinanceapp1.0'
            }
        }
        stage('Terraform Step){
              steps{
                  withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'a9a1c88f-de59-4017-92a8-be86bfe7824a', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    dir('terraform')
                      sh 'sudo chmod 600 aws.pem'
                      sh 'terraform.init'
                      sh 'terraform validate'
                      sh 'terraform apply --auto-aprove'
            }
              }
        }
    }
}

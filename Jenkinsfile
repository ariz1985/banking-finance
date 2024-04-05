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
                withCredentials([usernamePassword(credentialsId: '275b5561-beee-4cbc-9753-0c8c19889b8b', passwordVariable: 'docker_password', usernameVariable: 'docker_user')])
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
        stage('Terraform Step'){
              steps{
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: '6bf14740-ea40-43d2-b417-ca532cdaf0f1', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]){
                    dir('terraform'){
                      sh 'chmod 600 aws.pem'
                      sh 'terraform init'
                      sh 'terraform validate'
                      sh 'terraform apply --auto-approve'
                    }
            }
              }
        }
    }
}

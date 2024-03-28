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
}
}

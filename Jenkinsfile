pipeline {
    agent {
        docker { image 'node:16.13.1-alpine' }
    }
    stages {
        stage('Test') {
            steps {
                checkout scm
                sh 'node --version'
            }
        }
    }
}

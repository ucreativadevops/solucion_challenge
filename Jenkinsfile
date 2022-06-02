pipeline {
    agent {
        docker { image 'node:16.13.1-alpine' }
    }
    stages {
        stage('Test') {
            steps {
                checkout scm
                sh 'node --version'
                sh 'ls -la'
                sh 'npm install'
                sh 'npm run build'
                sh 'ls dist'
            }
        }
    }
}

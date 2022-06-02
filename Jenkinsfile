pipeline {
    agent {
        docker { image 'node' }
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
                sh 'cp dist/clase6/* /usr/share/nginx/html/'
            }
        }
    }
}

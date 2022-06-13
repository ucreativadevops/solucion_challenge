pipeline {
    agent any
  
    stages {
        stage('Angular Verification') {
            steps {
                sh "ng version"
            }
        }
        
        stage('Dependencies Installation') {
            steps {
                sh "npm install"
            }
        }

        stage('Lint Test Execution') {
            steps {
                sh "npm run lint"
            }
        }

        stage('Unit Test Execution') {
            steps {
                sh "npm run test"
            }
        }

        stage('Sonar Execution') {
            steps {
                sh "npm run sonar"
            }
        }

        stage('Build Execution') {
            steps {
                sh "npm run build"
            }
        }
        
        stage('Deploy Application') {
            steps {
                sh "cp dist/clase6/* /var/www/html"
            }
        }

        post {
            always {
                cleanWs()
            }
        }
    }
}
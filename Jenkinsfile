pipeline {
    agent {
        label "windows-vm"
    }

    stages {
        stage('Dotnet Verification') {
            steps {
                bat "ng version"
            }
        }
        
        stage('Dependencies Installation') {
            steps {
                bat "npm install"
            }
        }

        stage('Lint Test') {
            steps {
                bat "ng lint"
            }
        }

        stage('Unit Test') {
            steps {
                bat "ng test"
            }
        }

        stage('Build') {
            steps {
                bat "ng build"
            }
        }
        
        stage('Deploy Application') {
            steps {
                bat "xcopy dist/ C:\\tmp\\romell-pipeline /s /y"
            }
        }
    }
}
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
        stage('Build Execution') {
            steps {
                sh "npm run build"
            }
        }
        
//         stage('Deploy Application') {
//             steps {
//                 bat "xcopy dist\\clase6 C:\\inetpub\\wwwroot\\romell\\prod /s /y"
//             }
//         }
    }
}

pipeline {
    agent any
  
    stages {
        stage('Angular Verification') {
            steps {
                bat "ng version"
            }
        }
        
        stage('Dependencies Installation') {
            steps {
                bat "npm install"
            }
        }
        stage('Lint Test Execution') {
            steps {
                bat "npm run lint"
            }
        }
        stage('Unit Test Execution') {
            steps {
                bat "npm run test"
            }
        }
        stage('Build Execution') {
            steps {
                bat "npm run build"
            }
        }
        
//         stage('Deploy Application') {
//             steps {
//                 bat "xcopy dist\\clase6 C:\\inetpub\\wwwroot\\romell\\prod /s /y"
//             }
//         }
    }
}

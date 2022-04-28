pipeline {

  agent any

  stages {
    stage('Deploy') {
      steps {
        sshagent(credentials:['Prod'])
        sh '''
           cd /var/www/html
           cut index.html
           '''
      }
    }
  }
}

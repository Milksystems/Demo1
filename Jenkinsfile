pipeline {

  agent any

  stages {
    stage('Deploy') {
      steps {
        sshPublisher(credentials:['Prod'])
        sh '''
           cd /var/www/html
           cut index.html
           '''
      }
    }
  }
}

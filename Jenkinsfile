pipeline {

  agent any

  stages {
    stage('Deploy') {
      steps {
        sshagent(credentials:['github-ssh-key'])
        sh '''
           cd /var/www/html
           cut index.html
           '''
      }
    }
  }
}

pipeline {

  agent any

  stages {
    stage('Deploy') {
      steps {
        sshagent(['ssh-key'])
      }
    }
  }
}

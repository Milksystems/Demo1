pipeline {

  agent any

  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'git@github.com:Milksystems/Demo1.git', branch: 'main', credentialsId: 'github-ssh-key'])
      }
    }
    stage('Deploy') {
      steps {
        sshagent(['github-ssh-key'])
      }
    }
  }
}

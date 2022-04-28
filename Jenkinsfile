pipeline {

  agent any

  stages {
    stage('Deploy') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: 'Prod', transfers: [sshTransfer(execTimeout: 120000, sourceFiles: 'index.html')], )]
      }
    }
  }
}

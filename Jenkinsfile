pipeline {

  agent any

  stages {
    stage('Deploy') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: 'Prod', transfers: [sshTransfer(sourceFiles: 'index.html')], )])
      }
    }
  }
}

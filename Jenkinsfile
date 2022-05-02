pipeline {

  agent any

  stages {
    stage('Test') {
      steps {
        sh '''
        result=grep "Hello" index.html
           echo $result
        if  [ "$result" = "1" ]
        then
           echo "Test Passed"
        else
           echo "Test Failed"
        exit 1
        fi
        sh '''
      }
    }
    stage('Deploy') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: 'Prod', transfers:[sshTransfer(sourceFiles: 'index.html')], )])
      }
    }
  }
}
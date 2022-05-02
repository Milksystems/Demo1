pipeline {

  agent any

  stages {
    stage('Test') {
      steps {
        sh '''
        result=grep "Hello" index.html |wc -l
           echo $result
        if  [ "$result" = "1" ]
        then
           echo "Test Passed"
        else
           echo "Test Failed"
        exit 1
        fi
        '''
      }
    }
    stage('Deploy') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: 'Prod', transfers:[sshTransfer(sourceFiles: 'index.html')], )])
      }
    }
  }
}
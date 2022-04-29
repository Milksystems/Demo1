pipeline {

  agent any

  stages {
    stage('Deploy') {
      steps {
        sh '''
        ssh -o StrictHostKeyChecking=no -i Frankhurt2.pem sergey@172.31.0.194 uptime
        '''
    }
  }
}
}
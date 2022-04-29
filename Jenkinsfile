pipeline {

  agent any

  stages {
    stage('Deploy') {
      steps {
        sh '''
        sudo ssh sergey@172.31.0.194
        cd /var/www/html
        echo ll
        ll
        '''
    }
  }
}
}
node {
    try {
        stage('Build') {
            echo 'Building...'
            sh 'docker-compose build'
        }

        stage('Deploy') {
            echo 'Deploying...'
            sh 'docker-compose up -d'
        }
    } catch (Exception e) {
        throw e
    } finally {
        cleanWs()
    }
}

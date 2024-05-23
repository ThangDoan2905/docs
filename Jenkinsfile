node {
    try {
        stage('Prepare') {
            echo 'Preparing...'
            sh 'npm install -g mintlify'
        }

        stage('Deploy') {
            echo 'Deploying...'
            sh 'mintlify dev --port 3333'
        }
    } catch (Exception e) {
        throw e
    } finally {
        cleanWs()
    }
}

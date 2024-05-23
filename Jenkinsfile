pipeline {
    agent any

    environment {
        // Define the image name (local use only)
        DOCKER_IMAGE = 'docs'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from the repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image from the Dockerfile in the source code
                    docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Write environment variables to a .env file if needed
                    writeFile file: '.env', text: """
                    BUILD_NUMBER=${env.BUILD_NUMBER}
                    """
                    
                    // Deploy using Docker Compose
                    sh '''
                    docker-compose down
                    docker-compose up -d
                    '''
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace after the build
            cleanWs()
        }
    }
}

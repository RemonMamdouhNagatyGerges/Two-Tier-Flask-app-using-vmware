pipeline {
    agent any 

    stages {
        stage('Build & Run App') {
            steps {
                // Use the Docker Compose file you already built
                sh 'docker-compose up -d --build'
            }
        }

        stage('Run Unit Tests') {
            steps {
                // Run tests inside the running flask container
                // This replaces the 'python -m pytest' step that failed
                sh 'docker-compose exec -T flask-app python -m pytest tests/ -v'
            }
        }

        stage('Health Check') {
            steps {
                // Verify the app is accessible on port 5000 as per your requirements
                sh 'sleep 10'
                sh 'curl -f http://localhost:5000/health || exit 1'
            }
        }
    }

    post {
        failure {
            sh 'docker-compose down'
        }
    }
}
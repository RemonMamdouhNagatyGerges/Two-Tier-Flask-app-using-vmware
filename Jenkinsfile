pipeline {
    agent any 

    environment {
        IMAGE_NAME = "flask-2tier-app:v2.0"
    }

    stages {
        stage('Install Dependencies') {
            steps {
                // Equivalent to your 'Install dependencies' step
                sh 'python -m pip install --upgrade pip'
                sh 'pip install -r requirements.txt'
                sh 'pip install pytest'
            }
        }

        stage('Run Unit Tests') {
            steps {
                // Equivalent to your 'Run tests' step
                sh 'python -m pytest tests/ -v'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Equivalent to your 'Build Docker image' step
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Container Integration Test') {
            steps {
                // Equivalent to your 'Run container test' step
                sh "docker run -d -p 5000:5000 --name test-app ${IMAGE_NAME}"
                sh 'sleep 5'
                sh 'curl -f http://localhost:5000/health || (docker stop test-app && docker rm test-app && exit 1)'
                sh 'docker stop test-app'
                sh 'docker rm test-app'
            }
        }
    }
}
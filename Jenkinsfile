pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/your-repo.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("my-app")
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'echo "Running tests..."'
                        // Add test commands here
                    }
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        dockerImage.push("latest")
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                sshagent(['deploy-server-credentials']) {
                    sh 'ssh user@your-deploy-server "docker pull my-app:latest && docker run -d -p 80:80 my-app"'
                }
            }
        }
    }
}

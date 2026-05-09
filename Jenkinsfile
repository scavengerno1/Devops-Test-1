pipeline {
    agent { label 'Jenkins-Agent-1' }

    tools {
        maven 'maven3'
        jdk 'java17'
    }

    environment {
        appName = 'myapp'
        version = '1.0.0'
        DOCKER_USER = 'scavengerno1'
        IMAGE_NAME = "${DOCKER_USER}/${appName}"
        IMAGE_TAG = "v${BUILD_NUMBER}"
    }

    stages {
        stage('Clean workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout from SCM') {
            steps {
                git branch: 'main',
                    credentialsId: 'Git',
                    url: 'https://github.com/scavengerno1/Devops-Test-1.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'SonarQube') {
                        sh 'mvn sonar:sonar'
                    }
                }
            }
        }

        stage('Quality Gate') {
            steps {
                script {
                    timeout(time: 1, unit: 'HOURS') {
                        waitForQualityGate abortPipeline: false, credentialsId: 'SonarQube'
                    }
                }
            }
        }

        stage('Build & Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub') {
                        docker_image = docker.build("${IMAGE_NAME}:${IMAGE_TAG}", '.')
                        docker_image.push("${IMAGE_TAG}")
                        docker_image.push('latest')
                    }
                }
            }
        }
    }
}

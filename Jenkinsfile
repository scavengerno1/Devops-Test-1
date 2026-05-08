pipeline {
    agent { label 'Jenkins-Agent-1' }

    tools {
        maven 'maven3'
        jdk 'java17'
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
    }
}
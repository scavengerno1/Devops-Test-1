pipeline {
    agent { label 'Jenkins-agent' }

    tools {
        maven 'maven3'
        java 'java17'
    }

    stages {
        stage('Clean workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout from SCM') {
            steps {
                git credentialsId: 'Git', url: 'https://github.com/scavengerno1/Devops-Test-1.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

    }
}
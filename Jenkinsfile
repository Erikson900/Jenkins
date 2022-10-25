pipeline {
    agent any

    stages {
         stage('pre-build') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t test:v1 --target pre-build .'
            }
        }
        stage('build') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t test:v1 --target builder .'
            }
        }
        stage('test') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t test:v1 --target test .'
            }
        }
        stage('security') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t test:v1 --target security .'
            }
        }
        stage('backend') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t test:v1 --target backend .'
            }
        }
        stage('front-end') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t test:v1 --target frontend .'
            }
        }
        stage('deploy') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t test:v1 --target deploy .'
            }
        }
         stage('post') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t test:v1 --target post .'
            }
        }
    }
}

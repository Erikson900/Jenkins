pipeline {
    agent any

    stages {
        stage('run multi-stg build with buildkit') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t Test:v1 .'
            }
        }
    }
}

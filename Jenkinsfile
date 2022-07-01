pipeline {
    agent {'any'}

    tools { maven "maven" }

    stages {

        stage('Code') {
            steps {
                git 'https://github.com/marlyngiselle/aws_pipeline_java_jenkins_nexus'
            }
        }

        stage('Build') {
            steps {
                // sh 'mvn clean install'
                // sh 'docker stop contenedor'
                sh 'docker rm contenedor'
                sh 'docker build . -t registrycicd:8085/${JOB_NAME}:v${BUILD_NUMBER}'
            }
        }

        stage('Test') {
            steps {
                echo 'Ingresa en la pagina y prueba tu mismo'
            }
        }

        stage('Release') {
            steps {
                sh 'docker tag registrycicd:8085/${JOB_NAME}:v${BUILD_NUMBER} registrycicd:8085/${JOB_NAME}:latest'
                sh 'docker login -u admin -p 123 registrycicd:8085'
                sh 'docker push registrycicd:8085/${JOB_NAME}:v${BUILD_NUMBER}'
                sh 'docker push registrycicd:8085/${JOB_NAME}:latest'
                sh 'docker rmi registrycicd:8085/${JOB_NAME}:v${BUILD_NUMBER}'
                sh 'docker rmi registrycicd:8085/${JOB_NAME}:latest'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d -p 80:8080 --name contenedor registrycicd:8085/${JOB_NAME}:latest'
            }
        }
    }
 }
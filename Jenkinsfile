pipeline {

    agent { label 'x86-jenkins-bc-did' }

    triggers {
       cron('H 5 * * *')
    }

    stages {
        stage('Prep') {
          steps {

            withCredentials([usernamePassword(credentialsId: 'docker-login', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
              sh "echo $PASS | docker login --username $USER --password-stdin"

            }
          }
        }
        stage('Build image') {
          steps {
            sh "docker login"
            sh "docker build . -t williamgillaspy/dockerjdk8:dind"
          }
        }
        stage('Push the image.') {
          steps {
            sh "docker push williamgillaspy/dockerjdk8:dind"
          }
        }
    }
}
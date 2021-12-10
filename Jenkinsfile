pipeline {
  agent any
  stages {
    stage('Checkout Source') {
      steps {
        git 'https://github.com/Maxwell-Oyaro2/flaskapp.git'
      }
    }

    stage('Build image') {
      steps {
        script {
          dockerImage = docker.build dockerimagename
        }

      }
    }

    stage('Pushing Image') {
      environment {
        registryCredential = 'dockerhublogin'
      }
      steps {
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }

      }
    }

    stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deploymentservice.yaml", kubeconfigId: "kubernetes")
        }

      }
    }

  }
  environment {
    dockerimagename = 'oyaro/flaskapp1'
    dockerImage = ''
  }
}
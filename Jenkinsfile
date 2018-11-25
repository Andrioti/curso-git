pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t andrioti/marketplace-api .'
      }
    }
    stage('Tests') {
      steps {
        sh 'ls -l'
      }
    }
    stage('Aproval') {
      steps {
        input 'Você aprova isto para Deploy'
      }
    }
    stage('Deploy ') {
      steps {
        sh 'pwd '
      }
    }
  }
}
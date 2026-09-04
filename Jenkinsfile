pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: '0a2a713f-57cc-46e8-978d-de54ae250738',
                    url: 'https://github.com/tejeschavan99d/git-terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('module2') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan - VPC') {
            steps {
                dir('module2') {
                    sh 'terraform plan -target=module.vpc'
                }
            }
        }
    }
}


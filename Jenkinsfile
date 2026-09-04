pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
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

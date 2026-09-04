pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
        disableConcurrentBuilds()
    }

    stages {

        stage('Clean Workspace') {
            steps {
                deleteDir()
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/tejeschavan99d/git-terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('module2') {
                    sh '''
                        rm -rf .terraform
                        terraform init
                    '''
                }
            }
        }

        stage('AWS Credentials Test') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws-terraform']
                ]) {
                    sh '''
                        whoami
                        aws sts get-caller-identity
                    '''
                }
            }
        }

        stage('Terraform Plan - VPC') {
            steps {
                dir('module2') {
                    withCredentials([
                        [$class: 'AmazonWebServicesCredentialsBinding',
                         credentialsId: 'aws-terraform']
                    ]) {
                        sh '''
                            terraform plan -target=module.vpc
                        '''
                    }
                }
            }
        }
    }
}

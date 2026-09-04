pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
    }

    triggers {
        githubPush()
    }

    stages {

        stage('Checkout') {
            steps {
                sh '''
                    set -e

                    rm -rf .git module2

                    git clone --depth 1 --branch main \
                        https://github.com/tejeschavan99d/git-terraform.git .
                '''
            }
        }

        stage('AWS Credentials Test') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws-terraform']
                ]) {
                    sh '''
                        set -e
                        whoami
                        aws sts get-caller-identity
                    '''
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('module2') {
                    withCredentials([
                        [$class: 'AmazonWebServicesCredentialsBinding',
                         credentialsId: 'aws-terraform']
                    ]) {
                        sh '''
                            set -e
                            terraform init
                        '''
                    }
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
                            set -e
                            terraform plan -target=module.vpc
                        '''
                    }
                }
            }
        }
    }

    post {
        always {
            sh 'rm -rf module2/.terraform || true'
        }
    }
}

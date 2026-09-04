pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
    }

    stages {

        stage('Checkout') {
            steps {
                sh '''
                    set -e

                    rm -rf "${WORKSPACE}/git-terraform"

                    git clone --depth 1 --branch main \
                        https://github.com/tejeschavan99d/git-terraform.git \
                        "${WORKSPACE}/git-terraform"

                    cd "${WORKSPACE}/git-terraform"

                    git status
                    git log -1 --oneline
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
                dir('git-terraform/module2') {
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
                dir('git-terraform/module2') {
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
}

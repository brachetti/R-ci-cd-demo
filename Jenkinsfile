pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git checkout([$class: 'GitSCM', branches: [[name: '*/master']],
                    userRemoteConfigs: [[url: 'https://github.com/brachetti/R-ci-cd-demo.git']]])
                sh '''
                    git rev-parse --short HEAD > tag.tmp
                    '''
            }
        }
        stage('Setup') {
            steps {
                r '''
                  if (!requireNamespace("devtools", quietly = TRUE)) \
                    install.packages("devtools", repo="https://cloud.r-project.org"); \
                  devtools::install_deps(dependencies = TRUE)
                  '''
                r 'devtools::check()'
            }
        }
        stage('Test') {
            steps {
                sh 'echo "No Fail!"; exit 0'
            }
        }
    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}
pipeline {
    agent any

    environment {
        JENKINS_HOME_PATH = "$JENKINS_HOME_PATH"
        BUILD = "${JENKINS_HOME_PATH}/workspace/mlops_final_task"
    }

    stages {
         stage('Start') {
            steps {
                script {
                    echo 'Начало работы скриптов.'
                }
            }
        }
        stage('Preparation') {
            steps {
                cleanWs()
                checkout scm
            }
        }

        stage('Checkout') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/NadezhdinM/mlops_final_task.git'
                }
            }
        }

        stage('Path in JENKINS_HOME_PATH') {
            steps {
                script {
                    def jenkinsHome = env.JENKINS_HOME_PATH
                    def jobName = env.JOB_NAME
                    def workspacePath = "${jenkinsHome}\\workspace\\${jobName}"
                    echo "Путь к проекту: ${workspacePath}"
                    def currentDirectory = env.WORKSPACE
                    echo "Current directory: ${currentDirectory}"
                }
            }
        }

        stage('Build Docker image') {
            steps {
                 script {
                    bat "docker build -t titanic-img -f Dockerfile ."
                 }
            }
        }

        stage('Finish') {
            steps {
                script {
                    echo 'Работа скриптов завершена успешно'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}

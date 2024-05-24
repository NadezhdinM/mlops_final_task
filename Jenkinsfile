pipeline {
    agent any

    environment {
        JENKINS_HOME = "$JENKINS_HOME"
        BUILD = "${JENKINS_HOME}/workspace/mlops_final"
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

        stage('Setup Virtual Environment') {
            steps {
                script {
                    bat 'python -m venv venv'
                }
            }
        }

        stage('Activate venv') {
            steps {
                script {
                    bat '.\\venv\\scripts\\activate.bat'
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    bat 'pip install -r requirements.txt'
                }
            }
        }

        stage('Create dataset Titanic') {
            steps {
                script {
                    if (isUnix()) {
                        dir('src') {
                            sh 'python make_dataset_titanic.py'
                        }
                    } else {
                        dir('src') {
                            bat 'python make_dataset_titanic.py'
                        }
                    }
                }
            }
        }

        stage('Create model Titanic') {
            steps {
                script {
                    if (isUnix()) {
                        dir('src') {
                            sh 'python model_titanic.py'
                        }
                    } else {
                        dir('src') {
                            bat 'python model_titanic.py'
                        }
                    }
                }
            }
        }

        stage('App tests') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'pytest -v'
                    } else {
                        bat 'pytest -v'
                    }
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
}
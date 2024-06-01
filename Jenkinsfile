pipeline {
    agent any

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
                    git branch: 'main', url: 'https://github.com/NadezhdinM/mlops_final_task'
                }
            }
        }

        stage('Setup Virtual Environment') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'python -m venv venv'
                    } else {
                        bat 'python -m venv venv'
                    }
                }
            }
        }

        stage('Activate venv') {
            steps {
                script {
                    if (isUnix()) {
                        sh './venv/scripts/activate.bat'
                    } else {
                        bat '.\\venv\\scripts\\activate.bat'
                    }
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'pip install -r requirements.txt'
                    } else {
                        bat 'pip install -r requirements.txt'
                    }
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
                    if (isUnix()) {
                        sh 'docker build -t titanic-img .'
                    } else {
                        bat "docker build -t titanic-img -f Dockerfile ."
                    }
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
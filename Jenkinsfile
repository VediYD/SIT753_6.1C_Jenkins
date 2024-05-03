pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                echo "Using PyInstaller for building the python package."
                // Build project using PyInstaller
                sh '''
                    pyinstaller --onefile main.py
                '''
            }
        }

        stage('Test') {
            steps {
                echo "Using Pytest for testing the package."

                // Build project using PyInstaller
                sh '''
                    pytest test_main.py
                '''
            }
        }

        stage('Analysis') {
            steps {
                echo "Using PyLint for analyzing the package."

                // Build project using PyInstaller
                sh '''
                    pylint main.py
                '''
            }
        }
    }
}


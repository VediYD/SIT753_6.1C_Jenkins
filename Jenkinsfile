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
    }

    stages {
        stage('Test') {
            steps {
                echo "Using Pytest for testing the package."

                // Build project using PyInstaller
                sh '''
                    pytest test_main.py
                '''
            }
        }
    }
}


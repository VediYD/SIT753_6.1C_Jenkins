pipeline {
    agent any

    stages { 
        stage('Build') {
            steps {
                // Build project using PyInstaller
                sh '''
                    pyinstaller --onefile test.py
                '''
            }
        }
    }
}


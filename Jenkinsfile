pipeline {
    agent any

    stages { 
        stage('Build') {
            steps {
                // Build project using PyInstaller
                sh '''
                    pip install pyinstaller
                    pyinstaller --onefile your_script.py
                '''
            }
        }
    }
}


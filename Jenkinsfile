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
            post {
                always {
                    emailext(
                        subject: "Test Stage ${BUILD_STATUS}: ${currentBuild.fullDisplayName}",
                        body: "Test stage ${BUILD_STATUS.toLowerCase()} for ${currentBuild.fullDisplayName}",
                        to: 'vedi.yash@gmail.com'
                    )
                }
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

        stage('Security Check') {
            steps {
                echo "Using Bandit for analyzing the package."

                // Build project using PyInstaller
                sh '''
                    bandit main.py
                '''
            }
        }

        stage('Deploy - Staging') {
            steps {
                echo "Upload the artifacts created during the build stage OR Rebuild using Production like settings"
                echo "Remote-deploy the artifact to cloud server."
                echo "Depending on the nature of the artifact this might be different / specific."
                echo "For example, if I own this software, then I can upload it to the cloud platform hosting my exe files"
                echo "Which can then replace the existing / older ones, so that they are available for download."
                echo "Same logic can be applied anywhere else for anything else eg websites, pypi packages etc"
            }
        }

        stage('Integration - Test') {
            steps {
                echo "Integration tests are performed here."
                echo "Here we check if the new change in a production like environment meets the performance standards and works"
                echo "with the other systems properly"
            }
        }

        stage('Deploy - Production') {
            steps {
                echo "This is where the software can be uploaded to servers accessible via public ip, can can be used by the customers of the business"
                echo "This can be an EC2 instance, or pypi-production, or specific to the application."
            }
        }
    }
}

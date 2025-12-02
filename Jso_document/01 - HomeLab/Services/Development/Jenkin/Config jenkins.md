# First job in jenkins

Create a job to check dependencies (ex: node, python) and check update on jenkins server.

```Jenkinsfile
pipeline {
    agent any
    
    stages {
        stage('Check Update') {
            steps {
                sh "sudo apt update"
                sh "sudo apt upgrade -y"
            }
        }
        
        stage('Docker Version') {
            steps {
                sh "docker -v"
            }
        }
        
        stage('Node Version') {
            steps {
                sh "node -v"
                sh "npm -v"
            }
        }

		stage('Python Version') {
			steps {
				sh "python3 -v"
			}
		}
    }
}
```


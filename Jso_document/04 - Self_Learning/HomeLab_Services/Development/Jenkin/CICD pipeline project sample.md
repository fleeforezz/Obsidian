# For Nginx website

```Jenkinsfile
pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/fleeforezz/Jenkin_Test.git'
            }
        }
        
        stage('Docker Build') {
            steps {
                sh "sudo chmod 700 run-build.sh"
                sh "./run-build.sh"
            }
        }
        
        stage('Docker Push') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'e22b85f1-5241-443a-b99a-e29ba46768a5', toolName: 'docker') {
                        sh "sudo docker push fleeforezz/coffee1900"
                    }
                }
            }
        }
        
        // stage('Docker Deploy') {
        //     steps {
        //         script {
        //             withDockerRegistry(credentialsId: 'e22b85f1-5241-443a-b99a-e29ba46768a5', toolName: 'docker') {
        //                 sh "sudo docker stop coffee1900 || true && sudo docker rm coffee1900 || true"
        //                 sh "sudo docker run -d --name coffee1900 --rm -it -p 8081:80 fleeforezz/coffee1900:latest"
        //             }
        //         }
        //     }
        // }
        
        stage('Deploy to server') {
            steps {
                sshagent(['production']) {
                    sh "ssh -o StrictHostKeyChecking=no -l nhat 10.0.1.32  'sudo docker stop coffee1900 || true && sudo docker rmi coffee1900 || true && sudo docker run -d --name coffee1900 --rm -it -p 8083:80 fleeforezz/coffee1900:latest'"
                }
            }
        }
    }
}

```
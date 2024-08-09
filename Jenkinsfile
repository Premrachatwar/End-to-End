pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/premrachatwar/your-repo.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    sh 'mvn clean install'
                }
            }
        }
        stage('Test') {
            steps {
                junit '**/target/surefire-reports/*.xml'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                script {
                    sonarScanner {
                        properties([
                            "sonar.projectKey": "your_project_key",
                            "sonar.sources": "src/main/java",
                            "sonar.java.binaries": "target/classes"
                        ])
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("your_dockerhub_premrachatwar/your_app_name:${env.BUILD_ID}").push()
                }
            }
        }
        stage('Deploy to EKS') {
            steps {
                script {
                    kubectl.apply file: 'deployment.yaml'
                }
            }
        }
        stage('Publish to Artifactory') {
            steps {
                script {
                    rtMavenDeployer(
                        id: 'deployerId',
                        serverId: 'yourServerId',
                        releaseRepo: 'libs-release-local',
                        snapshotRepo: 'libs-snapshot-local'
                    )
                }
            }
        }
    }
}

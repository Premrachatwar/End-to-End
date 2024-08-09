pipeline {
    agent any

    stages {
        stage('Deploy to kubernetes') {
            steps {
                withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'EKS-1', contextName: '', credentialsId: 'k8-token', namespace: 'webapps', serverUrl: 'https://A3D23E1A72C7A87FAE24E17B7CA15E80.sk1.ap-south-1.eks.amazonaws.com']]) {
                    sh "kubectl apply -f deployment-service.yml"
                }
            }
        }
            stage('verify deployment') {
            steps {
              withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'EKS-1', contextName: '', credentialsId: 'k8-token', namespace: 'webapps', serverUrl: 'https://A3D23E1A72C7A87FAE24E17B7CA15E80.sk1.ap-south-1.eks.amazonaws.com']]) {
                   sh "kubectl get svc -n webapps"
                }
            }
        }
    }
}

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo '🚚 Đang lấy code từ GitHub...'
                checkout scm
            }
        }

        stage('Build & Test') {
            steps {
                echo '🛠️ Đang cài đặt thư viện và kiểm tra code...'
                // sh 'npm install'
                // sh 'npm test' 
            }
        }

        stage('Docker Build & Push') {
            steps {
                echo '🐳 Đang đóng gói Docker Image...'
                // sh 'docker build -t your-docker-hub-id/jenkins-demo:latest .'
                // sh 'docker push your-docker-hub-id/jenkins-demo:latest'
            }
        }
        stage('Build Docker Image') {
    steps {
        // Lệnh này để tạo ra Image từ Dockerfile của bạn
        sh 'docker build -t my-web-app:v1 .'
    }
}
        stage('Deploy') {
            steps {
                echo '🚀 Đang Deploy lên Server thực tế...'
                // sh 'docker-compose up -d'
            }
        }
    }
    
    post {
        success {
            echo '✅ Chúc mừng! Pipeline chạy thành công.'
        }
        failure {
            echo '❌ Toang rồi! Kiểm tra lại code hoặc cấu hình Jenkins.'
        }
    }
}
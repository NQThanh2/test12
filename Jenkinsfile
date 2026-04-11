pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                echo '🚚 Đang lấy code mới nhất từ GitHub...'
                checkout scm [cite: 3]
            }
        }
        stage('Build & Test') {
            steps {
                echo '🛠️ Đang cài đặt thư viện Node.js...'
                // Dùng sh thay cho bat trên Linux
                sh 'npm install' [cite: 4]
            }
        }
        stage('Dockerize & Deploy') {
            steps {
                echo '🐳 Bước 1: Đóng gói Docker Image...'
                sh 'docker build -t doan-cnpm .' [cite: 5]

                echo '🛑 Bước 2: Dọn dẹp Container cũ...'
                // Dùng || true để lệnh không bị lỗi nếu container chưa tồn tại
                sh 'docker rm -f web-app-demo || true' [cite: 6, 7, 8]

                echo '🚀 Bước 3: Khởi chạy ứng dụng...'
                sh 'docker run -d --name web-app-demo -p 3000:3000 doan-cnpm' [cite: 9]
            }
        }
    }
    post {
        success {
            echo '✅ Đã Deploy thành công!' [cite: 10, 11]
        }
        failure {
            echo '❌ Có lỗi xảy ra trong quá trình Build.' [cite: 12]
        }
    }
}
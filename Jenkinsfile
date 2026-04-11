pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo '🚚 Đang lấy code mới nhất từ GitHub...'
                checkout scm
            }
        }

        stage('Build & Test') {
            steps {
                echo '🛠️ Đang cài đặt thư viện Node.js...'
                bat 'npm install'
            }
        }

        stage('Dockerize & Deploy Local') {
            steps {
                echo '🐳 Bước 1: Đóng gói Docker Image...'
                // Tạo một bản đóng gói (image) tên là doan-cnpm
                bat 'docker build -t doan-cnpm .'

                echo '🛑 Bước 2: Dọn dẹp Container cũ đang chạy...'
                // Lệnh này giúp tránh lỗi "Port 3000 already in use" khi bạn build lần 2
                bat 'docker stop web-app-demo || ver > nul'
                bat 'docker rm web-app-demo || ver > nul'

                echo '🚀 Bước 3: Khởi chạy ứng dụng trên localhost:3000...'
                /* -d: chạy ngầm
                   -p 3000:3000: ánh xạ cổng 3000 của máy vào cổng 3000 của Docker
                   --name: đặt tên cho dễ quản lý
                */
                bat 'docker run -d --name web-app-demo -p 3000:3000 doan-cnpm'
            }
        }
    }
    
    post {
        success {
            echo '✅ Xong! Bây giờ bạn có thể mở http://localhost:3000 để xem kết quả.'
        }
        failure {
            echo '❌ Có lỗi xảy ra trong quá trình Build hoặc Dockerize.'
        }
    }
}
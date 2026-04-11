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
                // Mở khóa lệnh npm install để Jenkins thực sự kiểm tra code
                sh 'npm install'
            }
        }

        stage('Deploy to Render') {
            steps {
<<<<<<< HEAD
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
=======
                echo '🚀 Đang gọi Render để cập nhật bản build mới...'
                /* Thay URL dưới đây bằng Deploy Hook từ Render Dashboard 
                   Settings -> Deploy Hook 
                */
                sh 'curl -X GET https://api.render.com/deploy/srv-xxxx?key=yyyy' [cite: 5]
>>>>>>> 91743cce30aa0a5f9d3c6d3820e7f52e11c3b36f
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
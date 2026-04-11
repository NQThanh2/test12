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
                sh 'npm install' 
            }
        }

        stage('Deploy to Render') {
            steps {
                echo '🚀 Đang gọi Render để cập nhật bản build mới...'
                // Dùng dấu nháy đôi bao ngoài và nháy đơn bao URL để tránh lỗi ký tự đặc biệt
                sh "curl -X GET 'https://api.render.com/deploy/srv-xxxx?key=yyyy'" 
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
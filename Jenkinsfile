pipeline {
    agent any

    // Thêm block này để cấu hình NodeJS
    // LƯU Ý: Bạn phải vào Jenkins > Manage Jenkins > Tools 
    // Thêm cài đặt NodeJS và đặt tên chính xác là 'NodeJS' nhé.
    tools {
        nodejs 'NodeJS' 
    }

    stages {
        stage('Checkout') {
            steps {
                echo '🚚 Đang lấy code từ GitHub...'
                checkout scm
            }
        }

        stage('Build & Test') {
            steps {
                echo '🛠️ Đang cài đặt thư viện...'
                bat 'npm install'
            }
        }

        stage('Deploy to Render') {
            steps {
                echo '🚀 Đang gọi Render để cập nhật bản build mới...'
                // Đã sửa: Dùng nháy đơn bao ngoài và nháy kép bao URL cho Windows bat
                bat 'curl -X GET "https://api.render.com/deploy/srv-xxxx?key=yyyy"'
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
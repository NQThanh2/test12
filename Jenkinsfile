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

        stage('Docker Build & Push') {
            steps {
                echo '🚀 Đang gọi Render để cập nhật bản build mới...'
                /* Thay URL dưới đây bằng Deploy Hook từ Render Dashboard 
                   Settings -> Deploy Hook 
                */
                sh 'curl -X GET https://api.render.com/deploy/srv-xxxx?key=yyyy' [cite: 5]
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
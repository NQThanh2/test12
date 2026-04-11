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
        // Xóa container cũ nếu đang chạy để tránh trùng tên, sau đó chạy cái mới
        sh 'docker rm -f web-demo || true'
        sh 'docker run -d --name web-demo -p 3000:3000 my-web-app:v1'
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
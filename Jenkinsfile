node {
    def testEnv

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        testEnv = docker.build("mtan/googletest:${env.BUILD_ID}")
    }

    stage('Build app') {
        testEnv.inside {
            sh 'git clone https://github.com/Polonity/google_test_env.git'
            sh 'cd google_test_env'
            sh 'make'
        }
    }

    stage('Test app') {
        sh './bin/google-test-example1'
    }
}

node {
    def testEnv

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        testEnv = docker.build("mtan/googletest:${env.BUILD_ID}")
    }

    testEnv.inside {
        stage('Build app') {
            sh 'cd google_test_env'
            sh 'make'
        }
        stage('Test app') {
            sh './bin/google-test-example1'
            sh ' gcovr . --xml --output=test.xml'
        }
    }
}

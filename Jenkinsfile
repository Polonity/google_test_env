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
            cobertura (
                autoUpdateHealth: false,
                autoUpdateStability: false,
                coberturaReportFile: 'bin/cover.xml',
                conditionalCoverageTargets: '70, 0, 0',
                failUnhealthy: false,
                failUnstable: false,
                lineCoverageTargets: '80, 0, 0',
                maxNumberOfBuilds: 0,
                methodCoverageTargets: '80, 0, 0',
                onlyStable: false,
                zoomCoverageChart: false
            )
        }
    }
}

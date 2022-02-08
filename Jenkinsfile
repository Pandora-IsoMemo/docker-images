pipeline {
    agent { label 's' }
    options { disableConcurrentBuilds() }
    triggers {
        cron('H 0 * * *')
    }
    environment {
        DOCKER_REPO = 'registry.core.inwt.de'
        EMAIL = 'andreas.neudecker@inwt-statistics.de'
        DOCKER_REGISTRY = credentials('core-docker-registry-user')
    }
    stages {
        stage('BSMC') {
            when { branch 'master' }
            steps {
                sh '''
                echo $DOCKER_REGISTRY_PSW | docker login --username $DOCKER_REGISTRY_USR --password-stdin $DOCKER_REPO
                docker build --pull -t $DOCKER_REPO/bmsc-base bmsc-base
                docker push $DOCKER_REPO/bmsc-base
                '''
            }
        }

        stage('BSMC + Shiny') {
            agent { label 'vm1' }
            when { branch 'master' }
            steps {
                sh '''
                echo $DOCKER_REGISTRY_PSW | docker login --username $DOCKER_REGISTRY_USR --password-stdin $DOCKER_REPO
                docker pull $DOCKER_REPO/bmsc-base
                docker tag $DOCKER_REPO/bmsc-base bmsc-base
                docker build -t $DOCKER_REPO/bmsc-shiny-base bmsc-shiny-base
                docker push $DOCKER_REPO/bmsc-shiny-base
                '''
            }
        }

        stage('ReSources + IsoApp') {
            when { branch 'master' }
            steps {
                sh '''
                echo $DOCKER_REGISTRY_PSW | docker login --username $DOCKER_REGISTRY_USR --password-stdin $DOCKER_REPO
                docker build --pull -t $DOCKER_REPO/resources-isoapp-base resources-isoapp-base
                docker push $DOCKER_REPO/resources-isoapp-base
                '''
            }
        }
    }
    post {
        failure {
           script {
                if (env.BRANCH_NAME == 'main' || env.BRANCH_NAME == 'depl') {
                    emailext (
                        attachLog: true,
                        body: "Build of job ${env.JOB_NAME} (No. ${env.BUILD_NUMBER}) has completed\n\nBuild status: ${currentBuild.currentResult}\n\n${env.BUILD_URL}\n\nSee attached log file for more details of the build process.",
                        recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
                        to: "${env.EMAIL}",
                        subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
                    )
                }
            }
        }
    }
}

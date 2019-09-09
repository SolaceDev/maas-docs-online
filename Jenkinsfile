@Library(['maas-jenkins-library@master']) _

pipeline {
    agent {
        kubernetes {
            label "build-service-${UUID.randomUUID().toString().substring(0, 8)}"
            yaml """
      apiVersion: v1 
      kind: Pod 
      spec:
        serviceAccountName: jenkins-deploy
        containers: 
          - name: python
            image: python:2.7
            command: ['cat']
            tty: true
          - name: jenkins-kubernetes-cli
            image: dtzar/helm-kubectl:latest
            command: ['cat']            
            tty: true
          - name: docker
            image: docker:18-dind
            securityContext:
              privileged: true
            env:
              - name: DOCKER_HOST 
                value: tcp://localhost:2375
            volumeMounts:
              - name: aws-ecr-login
                mountPath: /root/.docker/config.json
                subPath: .dockerconfigjson
              - name: dind-storage
                mountPath: /var/lib/docker
        volumes:
          - name: dind-storage
            emptyDir: {}
          - name: aws-ecr-login
            secret:
              secretName: aws-ecr-login
             """
        }
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    environment {
        component = env.GIT_URL.minus("https://github.com/SolaceDev/").minus(".git")
        workspace = pwd(tmp: false)
    }

    stages {
        stage('Build') {
            when {
                expression { GIT_BRANCH.startsWith("PR-") }
            }
            steps {
                script {
                    container('python') {
                        //Build static HTML artifacts
                        dir("${workspace}/docs") {
                            sh("pip install -r requirements.txt && make html")
                        }
                    }
                    container('docker') {
                        sh("docker build . -t  868978040651.dkr.ecr.us-east-1.amazonaws.com/maas-docs-online:${env.GIT_BRANCH}")
                        sh("docker push 868978040651.dkr.ecr.us-east-1.amazonaws.com/maas-docs-online:${env.GIT_BRANCH}")
                    }
                }
            }
        }
//        868978040651.dkr.ecr.us-east-1.amazonaws.com/maas-docs-online:latest
        stage('Deploy PR Environment') {
            when {
                expression { GIT_BRANCH.startsWith("PR-") }
            }
            steps {
                script {
                    container('jenkins-kubernetes-cli') {
                        dir("${workspace}") {
                            env.PR_NUM = env.GIT_BRANCH.minus("PR-")
                            sh("kubectl get pods")
                            sh("""
                                sed -i \"s|{{DEPLOYMENT_NAME}}|pr-${env.PR_NUM}-maas-docs|\"  pr-deploy.yml
                                sed -i \"s|{{REPOSITORY}}|868978040651.dkr.ecr.us-east-1.amazonaws.com/maas-docs-online|\"  pr-deploy.yml
                                sed -i \"s|{{TAG}}|${env.GIT_BRANCH}|\"  pr-deploy.yml
                                sed -i \"s|{{SERVICE_NAME}}|service-pr-${env.PR_NUM}-maas-docs|\" pr-deploy.yml
                                sed -i \"s|{{INGRESS_NAME}}|ingress-pr-${env.PR_NUM}-maas-docs|\" pr-deploy.yml
                                sed -i \"s|{{HOST_NAME}}|pr${env.PR_NUM}.docs.jcorpuz.k8s.mymaas.net|\" pr-deploy.yml
                            """)
                            sh("cat pr-deploy.yml")
                            sh(script: "kubectl delete -f pr-deploy.yml", returnStatus: true)
                            sh("kubectl apply -f pr-deploy.yml")
                        }
                    }
                }
            }
        }
    }
}




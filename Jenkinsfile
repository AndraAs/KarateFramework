pipeline {
    agent any
    tools{
        maven 'MAVEN'
    }
    stages{
        stage('Cleanup stage'){
            steps{
                //define step
                echo 'Cleanup stage'
                cleanWs notFailBuild: true
            }
        }
         stage('Git Checkout'){
             steps{
                //define step
                echo 'Git Checkout'
                checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/AndraAs/KarateFramework.git']])
            }
            
        }
         stage('Restore Package stage'){
             steps{
                //define step
                echo 'Restore Package stage'
            }
            
        }
         stage('Build stage'){
             steps{
                //define step
                echo 'Build stage'
                script{
                    sh "mvn clean compile"
                }
            }
            
        }
         stage('Test Execution stage'){
              steps{
                //define step
                echo 'Test Execution started'
                script{
                    sh "mvn test"
                }
                echo 'Test Execution completed'
            }
            
        }
    }
    post {
  always {
    // One or more steps need to be included within each condition's block.
    cucumber buildStatus: 'UNCHANGED', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/karate-reports', pendingStepsNumber: -1, reportTitle: 'KARATE TEST EXECUTION', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
  }
}
}
pipeline {
  agent {
    dockerfile {
      args '--net host'
    }
  }
  environment {
    REPO_USER = 'demo'
    REPO_PASSWORD = 'demodemo'
    REPO_URL = 'http://localhost:8081/artifactory/api/conan/conan-local'
  }
  stages {
    stage('Style check') {
      steps {
        script {
          try {
            def script = '''#!/bin/bash
            diff -u <(find . -name '*.cpp' -o -name '*.h' -exec clang-format {} \\;) <(find . -name '*.cpp' -o -name '*.h' -exec cat {} \\;)'''
            sh script:script, returnStdout:true
          }
          catch (Exception e) {
            currentBuild.result = 'UNSTABLE'
          }
        }
      }
    }

    stage('Build') {
      steps {
        cmakeBuild buildDir: 'build', cmakeArgs: '-DBUILD_SAMPLE=ON', installation: 'InSearchPath', steps: [[withCmake: true]]
        recordIssues enabledForFailure: true, qualityGates: [[threshold: 1, type: 'TOTAL', unstable: true]], tools: [clangTidy()]
      }
    }

    stage('Unit test') {
      steps {
        ctest arguments: '-T test --no-compress-output', installation: 'InSearchPath', workingDir: 'build'
        xunit([CTest(deleteOutputFiles: true, failIfNotNew: true, pattern: 'build/Testing/**/*.xml', skipNoTestFiles: false, stopProcessingIfError: true)])
      }
    }

    stage('Upload arifacts') {
      steps {
        sh 'rm -fr build'
        sh '''
          conan remote add demo ${REPO_URL} && \
          conan user ${REPO_USER} -r demo -p ${REPO_PASSWORD}
        '''
        sh 'conan create . --build missing'
        sh 'yes | conan upload static_analysis_metrix/0.1 -r=demo'
      }
    }
  }
}

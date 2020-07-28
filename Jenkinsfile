pipeline {
  agent {
    dockerfile true
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
  }
}

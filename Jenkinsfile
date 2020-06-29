pipeline {
   agent {
     dockerfile true
   }
   stages {
     stage('Build') {
       steps {
        sh '''
          mkdir -p build;
          cd build;

          cmake -DBUILD_SAMPLE=ON -DCMAKE_INSTALL_PREFIX=installation -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -G Ninja ..;
          cmake --build . -- -j8;
          find .. -name *.cpp -exec clang-tidy -p . {} \\;
        '''
        recordIssues enabledForFailure: true, qualityGates: [[threshold: 1, type: 'TOTAL', unstable: true]], tools: [clangTidy()]
      }
    }

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
  }
}

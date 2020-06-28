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

          cmake -DBUILD_SAMPLE=ON -DCMAKE_INSTALL_PREFIX=installation -G Ninja ..;
          cmake --build . -- -j8;
        '''
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
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
   }
}

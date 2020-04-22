pipeline{   
      agent any
      steps{
      stage('Test'){
        steps{
          sh '''
                docker run mattcrutchley/petsbackend -n backend
                docker exec backend <<EOF
                /mvnw test
      EOF
             '''   
        }
    } 
}
}

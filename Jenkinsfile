pipeline{   
      agent any
      stages{
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

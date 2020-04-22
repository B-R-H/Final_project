pipeline{   
      agent any
      stages{
      stage('Test'){
        steps{
          sh '''
                sudo docker run mattcrutchley/petsbackend -n backend
                sudo docker exec backend sh <<EOF
                /mvnw test
      EOF
             '''   
        }
    } 
}
}

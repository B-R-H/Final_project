pipeline{   
      agent any
      stages{
      stage('Test'){
        steps{
          sh '''
                sudo docker run --name backend mattcrutchley/petsbackend
                sudo docker exec backend sh <<EOF
                /mvnw test
      EOF
             '''   
        }
    } 
}
}

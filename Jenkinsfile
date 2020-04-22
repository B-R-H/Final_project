pipeline{   
      agent any
      stages{
      stage('Test'){
        steps{
          sh '''
                sudo docker stop backend
                sudo docker run -d --name backend mattcrutchley/petsbackend
                sudo docker exec backend sh <<EOF
                /mvnw test
      EOF
             '''   
        }
    } 
}
}

pipeline{   
      agent any
      stages{
      stage('Test'){
        steps{
          sh '''
                sudo docker run -d --name backend mattcrutchley/petsbackend
                sudo docker exec -i backend sh <<EOF
                /mvnw test
      EOF
      sudo docker stop backend
      sudo docker rm backend 
      sudo docker rmi mattcrutchley/petsbackend
             '''   
        }
    } 
}
}

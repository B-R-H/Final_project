pipeline{   
      agent any
      stages{
      stage('Test'){
        steps{
          sh '''
                sudo docker run -d --name backend mattcrutchley/petsbackend
                sudo docker exec backend sh <<EOF
                /mvnw test
                pwd
      EOF
      sudo docker stop backend
      sudo docker rm backend 
      sudo docker rmi mattcrutchley/petsbackend
             '''   
        }
    } 
}
}

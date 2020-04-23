pipeline{   
      agent any
      stages{
      stage('Test'){
        steps{
          sh '''
            
            rm -rf spring-petclinic-rest
            git clone https://github.com/spring-petclinic/spring-petclinic-rest.git
            cd spring-petclinic-rest
            mvn test
            
            
             '''   
          }
       }
        stage('Deploy'){
           steps{
            sh '''
           
            cd 
            rm -rf Final_project
            git clone https://github.com/B-R-H/Final_project.git
            cd Final_project
            git checkout develop
            kubectl apply -f k8s
            
            '''
           }
        }
            
    }
}

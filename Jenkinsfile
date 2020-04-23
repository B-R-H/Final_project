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
            sleep 10s
            export NGINX_IP=$(kubectl get service nginx -o custom-columns=:status.loadBalancer.ingress[0].ip)
            echo ${NGINX_IP:1:}
            while [${NGINX_IP} -eq <none>]
            do
            sleep 1s
            export NGINX_IP=$(kubectl get service nginx -o custom-columns=:status.loadBalancer.ingress[0].ip)
            done
            kubectl apply -f k8s
            export NGINX_IP=<none>
            '''
           }
        }
            
    }
}

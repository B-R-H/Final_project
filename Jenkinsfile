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
            #!/bin/bash
            rm -rf Final_project
            git clone https://github.com/B-R-H/Final_project.git
            cd Final_project
            git checkout develop
            kubectl apply -f k8s
            kubectl get service nginx -o custom-columns=IP:status.loadBalancer.ingress[0].ip > test.txt
            export NGINX_IP=$(sed -n 2p test.txt)
	    sed "s/localhost/${NGINX_IP}/g" k8s/frontend.yaml > k8s/frontend.yaml
	    sleep 2
	    cat k8s/frontend.yaml
            kubectl apply -f k8s
            '''
           }
        }
            
    }
}

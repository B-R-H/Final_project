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
            c=1
            while [ $c -le 5 ]
            do
	      echo "Welcone $c times"
	      (( c++ ))
            done
            rm -rf Final_project
            git clone https://github.com/B-R-H/Final_project.git
            cd Final_project
            git checkout develop
            kubectl apply -f k8s
            sleep 10s
            kubectl get service nginx -o custom-columns=IP:status.loadBalancer.ingress[0].ip > test.txt
            export NGINX_IP=$(sed -n 2p test.txt)
            while [${NGINX_IP} -eq <none>]
            do
            sleep 1s
            kubectl get service nginx -o custom-columns=IP:status.loadBalancer.ingress[0].ip > test.txt
            export NGINX_IP=$(sed -n 2p test.txt)
            done
            kubectl apply -f k8s
            export NGINX_IP=<none>
            rm test.txt
            '''
           }
        }
            
    }
}

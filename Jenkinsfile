pipeline {
    agent any 
	
    stages{
        
	    stage("Git login"){
  		steps {
      		git branch: 'main', url: 'https://github.com/kedar1704/Jenkins-Terraform-Ansible-Integration.git'
          }
      }
      
      stage("Terraform Init"){
        steps{
               sh label: '', script: 'terraform init'

             }
	     }
      
      stage("Terraform Plan"){
        steps{
               sh label: '', script: 'terraform plan'

             }
	     }
      
      stage ("terraform Action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve') 
           }
        }
      
    }
}

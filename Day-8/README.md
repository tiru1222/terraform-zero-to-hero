# MIGRATION TO TERRAFORM--
Migrating or importing an already configured cloud resource, such as an instance, from an existing CloudFormation (CFT) stack into Terraform.

provider "aws" {
  
  region = ------

}

import {
  
  id= "instance id"  #id of instance which has to import
  
  to= aws_instance.example
  
  }
  
  Then give
  
  terraform plan generate_config_out=generate.tf  #this will create new file generate.tf which has all the imported resource data like ami, instance_type,vpc,sg,....
  
  Now copy that data like ami,instance_type, any if u want and place in like;
  
  provider "aws" {
 
  region = ------
 
  }
  
  resource "aws_instance" "example" {
  
  --------------
  
  -----------
 
  }
  
   Then give
   
   terraform import aws_instance.example instance_id   #After importing the resource, Terraform will create a state file (usually named terraform.tfstate)
   Then give terraform apply to create new resource.

   DRIFT DETECTION IN INFRASTRUCTURE:
   Terraform's "drift detection" refers to the process of identifying differences between your declared infrastructure configuration (Terraform code) and the actual state of your resources. Detecting drift is important because it helps you identify if any resources have been modified or changed manually outside of Terraform. Here are the steps to identify drift in Terraform:
  
   terraform plan with Refresh:
When you run terraform plan, Terraform performs a refresh by querying the current state of your infrastructure without making any changes. This allows Terraform to detect any drift between the state it expects and the actual state.

terraform plan -refresh=true

The refresh flag (-refresh=true) tells Terraform to perform a full refresh before planning. After running the plan, Terraform will show changes that would be applied to bring the infrastructure in sync with the configuration.

Terraform State Commands:
You can use Terraform's state management commands to inspect the current state and detect drift. Some useful commands include:

terraform state list: Lists all resources in the current state.

terraform state show: Displays details of a specific resource's state.

terraform state pull: Retrieves the latest state from the backend.

For example, you can use these commands to compare the actual resource attributes with what you expect from your configuration. If there are differences, that indicates drift.

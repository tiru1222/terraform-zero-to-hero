# Overview of steps

Create a directory for your Terraform project and create a Terraform configuration file (usually named `main.tf`) in that directory. In this file, you define the AWS provider and resources you want to create. Here's a basic example:

```hcl
   provider "aws" {
     region = "us-east-1"  # Set your desired AWS region
   }

   resource "aws_instance" "example" {
     ami           = "ami-0c55b159cbfafe1f0"  # Specify an appropriate AMI ID
     instance_type = "t2.micro"
   }
```
Actually if u press dot(.) in github it will directly goes to visual-studio here we install some plugins called terraform, HCL,.. to automate terraform coding process like pre-suggestions, indetations.
## Initialize Terraform**

In your terminal, navigate to the directory containing your Terraform configuration files and run:

```
terraform init
```

This command initializes the Terraform working directory, downloading any necessary provider plugins.

## Apply the Configuration

Run the following command to create the AWS resources defined in your Terraform configuration:

```
terraform apply
```

Terraform will display a plan of the changes it's going to make. Review the plan and type "yes" when prompted to apply it.

## Verify Resources

After Terraform completes the provisioning process, you can verify the resources created in the AWS Management Console or by using AWS CLI commands.

## Destroy Resources

If you want to remove the resources created by Terraform, you can use the following command:

```
terraform destroy
```

Be cautious when using `terraform destroy` as it will delete resources as specified in your

TERRAFORM lifecycle:
TERRAFORM INIT:
It initializes the provider, module version requirements, and backend configurations.
TERRAFORM PLAN:
Determines the state of all resources and compares them with real or existinginfrastructure. It uses terraform state file data to compare and provider API to check.
TERRAFORM APPLY:
Executes the actions proposed in a Terraform plan.
TERRAFORM DESTROY:
It will destroy terraform-managed infrastructure or the existing enviornment
NOTE:
We can use -auto-approve command for Apply and Destroy phases.
Lets assume if we have multiple instances/resources in a terraform, if we want to delete a single instance/resorce first we have to check the list of resources present in main.tf file using terraform state list
so it will gives the list of entire resources to delete particular resorce:
terraform destroy -target=aws_instance.key[0]

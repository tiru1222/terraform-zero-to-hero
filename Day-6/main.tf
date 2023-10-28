TERRAFORM WORKSPACE:
Terraform Workspace is something that you can use when you want to work on multiple environments at same time.
To create a new workspace : terraform workspace new workspace_name
To list the workspace: terraform workspace list
To show current workspace: terraform workspace show
To switch workspace: terraform workspace select workspace_name
So here u can swithed to different environments and if u use terraform apply state_files created for different environments separately.

provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  description = "value"
}

variable "instance_type" {
  description = "value"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.xlarge"
  }
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}
Here var.instance_type -- In which lookup function has to do action
terraform.workspace -- inbuild terraform-workspace-variable it will read as current workspace(i,e if u use terraform apply in dev-workspace then it will auto taken as dev env in map fun).
t2.micro -- default value means if no workspace matched.

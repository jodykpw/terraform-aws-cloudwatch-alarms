# AWS EC2 Instance Terraform Variables
variable "bastion_instance_type" {
  description = "EC2 Bastion Instance Type"
  type = string
  default = "t2.micro"  
}

variable "private_instance_type" {
  description = "EC2 Private Instance Type"
  type = string
  default = "t2.micro"  
}

variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type = string
  default = "terraform-key"
}

variable "private_instance_count" {
  description = "AWS EC2 Private Instances Count"
  type = number
  default = 1
}
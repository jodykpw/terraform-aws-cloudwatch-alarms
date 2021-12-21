# Define Local Values in Terraform
locals {
  environment = var.environment
  project     = var.project
  name        = "${var.project}-${var.environment}"
  common_tags = {
    "terraform": "true",
    "owner": "${var.owner}",
    "business divsion": "${var.business_divsion}",
    "project": "${local.project}",
    "environment": "${local.environment}"
  }

  asg_tags = [
    {
      key                 = "Environment"
      value               = "${local.environment}"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = "megasecret"
      propagate_at_launch = true
    },
  ]
  
}
# Autoscaling Variables
# AWS Autoscaling Terraform Variables
variable "asg_sns_topic_subscription_email" {
  description = "Autoscaling SNS topic email to"
  type = string
}
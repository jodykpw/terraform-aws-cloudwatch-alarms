# AWS Route 53 Variables
variable "route53_mydomain" {
  description = "Domain Name"
  type = string 
  default = "domain.com"
}

variable "route53_apps_dns" {
  description = "Apps DNS Name"
  type = string 
  default = "asg-lc.domain.com"
}

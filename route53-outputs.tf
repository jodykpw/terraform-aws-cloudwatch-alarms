# AWS Route 53 Outputs
output "mydomain_zoneid" {
  description = "The Hosted Zone id of the desired Hosted Zone"
  value = data.aws_route53_zone.mydomain.zone_id 
}

output "mydomain_name" {
  description = " The Hosted Zone name of the desired Hosted Zone."
  value = data.aws_route53_zone.mydomain.name
}
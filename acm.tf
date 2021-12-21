# AWS Certificate Manager (ACM) Terraform Module
module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "3.0.0"

  domain_name  = trimsuffix(data.aws_route53_zone.mydomain.name, ".")
  zone_id      = data.aws_route53_zone.mydomain.zone_id 
  subject_alternative_names = var.subject_alternative_names
  
  tags = local.common_tags
}


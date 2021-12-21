# AWS Certificate Manager (ACM) Variables
variable "subject_alternative_names" {
  description = "A list of domains that should be SANs in the issued certificate"
  type        = list(string)
  default     = ["*.domain.com"]
}
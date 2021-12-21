# General Variables
variable "aws_profile" {
  description = "AWS Credentials Profile."
  type = string
  default = "default"
}

variable "owner" {
  description = "Who to contact about the resource."
  type = string
  default = "admin@email.com"
}

variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"  
}

variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type = string
  # Tag values may only contain unicode letters, digits, whitespace, or one of these symbols: _ . : / = + - @
  default = "rnd" 
}

variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  # Tag values may only contain unicode letters, digits, whitespace, or one of these symbols: _ . : / = + - @.
  # Use lowercase.
  # Keep it short.
  default = "dev"
}

variable "project" {
  description = "The name for the project"
  type = string
  # Tag values may only contain unicode letters, digits, whitespace, or one of these symbols: _ . : / = + - @.
  # Use lowercase.
  # Keep it short.
  default = "demo"
}
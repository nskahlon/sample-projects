variable "oac_name" {
  description = "Name of OAC"
  type = string
}

variable "s3_regional_domain" {
  description = "S3 Regional domain"
  type = string
}

variable "cf_aliases" {
  type = list(string)
  description = "Aliases to be appeneded wih CF distribution."
  default = []
}
variable "default_acm_cert_cf_distribution" {
  type = string
  description = "ACM ARN to be used with the default CF"
  default = "arn:aws:acm:us-east-1:359196653330:certificate/813a3bea-a8c3-4b04-8d57-6a442874a144"
}
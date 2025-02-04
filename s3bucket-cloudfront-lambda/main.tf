provider "aws" {
  alias  = "useast1"
  region = "us-east-1"
}

module "intact_s3_bucket" {
  source      = "./modules/s3bucket"
  bucket_name = "project-images-nkahlon"
  tags = {
    "Owner"     = "Navneet Kahlon"
    "Terraform" = "True"
  }
}
module "intact_cf_distribution" {
  depends_on         = [module.intact_s3_bucket]
  source             = "./modules/cloudfront"
  s3_regional_domain = module.intact_s3_bucket.regional_domain
  default_acm_cert_cf_distribution = "arn:aws:acm:us-east-1:359196653330:certificate/813a3bea-a8c3-4b04-8d57-6a442874a144"
  cf_aliases         = ["dev-project-images.cs.idc.com", "dev-project-images.idc-cs-assessment.com"]
  oac_name           = module.intact_s3_bucket.name
}
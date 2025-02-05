provider "aws" {
  alias  = "useast1"
  region = "us-east-1"
}

module "intact_s3_bucket" {
  //source      = "./modules/s3bucket"
  source = "github.com/nskahlon/sample-projects/s3bucket-cloudfront-lambda/modules/s3bucket?ref=v1.0.0-alpha"
  bucket_name = "project-images-nkahlon"
  tags = {
    "Owner"     = "Navneet Kahlon"
    "Terraform" = "True"
  }
}
module "intact_cf_distribution" {
  depends_on         = [module.intact_s3_bucket]
  source             = "github.com/nskahlon/sample-projects/s3bucket-cloudfront-lambda/modules/cloudfront?ref=v1.0.0-alpha"
  s3_regional_domain = module.intact_s3_bucket.regional_domain
  default_acm_cert_cf_distribution = "arn:aws:acm:us-east-1:359196653330:certificate/813a3bea-a8c3-4b04-8d57-6a442874a144"
  cf_aliases         = ["dev-project-images.cs.idc.com", "dev-project-images.idc-cs-assessment.com"]
  oac_name           = module.intact_s3_bucket.name
}
module "lambda_role" {
  source = "./modules/iam"
  rolename = "lambda_execution_role"  
}

module "lambda_function" {
  source = "./modules/lambda"
  function_name = "lambda_function" 
  lambda_role_name = module.lambda_role.lambda_role_arn 
}
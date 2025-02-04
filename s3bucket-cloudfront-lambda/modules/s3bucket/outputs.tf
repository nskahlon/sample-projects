output "arn" {
  description = "Outputs ARN of the created bucket"
  value = aws_s3_bucket.intact_s3_bucket.arn
}

output "name" {
  description = "Outputs Name of the created bucket"
  value = aws_s3_bucket.intact_s3_bucket.id
}

output "regional_domain" {
  description = "Outputs the acl status of the created bucket"
  value = aws_s3_bucket.intact_s3_bucket.bucket_regional_domain_name
}
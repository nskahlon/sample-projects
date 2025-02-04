output "s3_bucket_name" {
  description = "Name of created S3 Bucket"
  value       = module.intact_s3_bucket.name
}

output "s3_bucket_arn" {
  description = "ARN of created S3 Bucket"
  value       = module.intact_s3_bucket.arn
}

output "cf_distribution_id" {
  description = "Some discription"
  value       = module.intact_cf_distribution.cf_distribution_id
}
output "cf_distribution_aliases" {
  description = "Some discription"
  value       = module.intact_cf_distribution.cf_distribution_aliases
}
output "cf_distribution_id" {
    description = "Distribution ID of created cloudfront"
    value = aws_cloudfront_distribution.s3_distribution.id
}

output "cf_distribution_aliases" {
  description = "Aliases of created distribution"
  value = aws_cloudfront_distribution.s3_distribution.aliases
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}
resource "aws_s3_bucket" "intact_s3_bucket" {
    provider = aws
    bucket = var.bucket_name
    tags = var.tags
    force_destroy = true
}
resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
  bucket = aws_s3_bucket.intact_s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.intact_s3_bucket.id
  versioning_configuration {
    status = var.s3versioningstatus
  }
}
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.intact_s3_bucket.bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_sse" {
  bucket = aws_s3_bucket.intact_s3_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms" 
    }
  }
}
resource "aws_s3_object" "s3_object" {
  bucket = aws_s3_bucket.intact_s3_bucket.id
  key = "frontend/"
}
resource "aws_s3_bucket_cors_configuration" "s3_cors_configuration" {
  bucket = aws_s3_bucket.intact_s3_bucket.id
  cors_rule {
    allowed_origins = ["*"]
    allowed_methods = ["GET"]
  }
}
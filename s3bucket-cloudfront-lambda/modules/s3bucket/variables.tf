variable "bucket_name" {
    type = string
    description = "Bucket name to be used. Usually has projectname and environment type."  
}
variable "tags" {
    type = map(string)
    description = "Tags to be appended. Usually has project name, Owner and cost code if any"
    default = {
      
    }
}
variable "s3versioningstatus" {
    type = string
    default = "Disabled"
    description = "Enable or disable S3 bucket versioning"
}

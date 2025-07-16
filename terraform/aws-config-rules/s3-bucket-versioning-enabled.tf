resource "aws_config_config_rule" "s3_bucket_versioning" {
  name        = "s3-bucket-versioning-enabled"
  description = "Checks if S3 buckets have versioning enabled"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_VERSIONING_ENABLED"
  }
}

resource "aws_config_config_rule" "s3_versioning_enabled" {
  name = "s3-bucket-versioning-enabled"
  description = "Checks whether versioning is enabled for your S3 buckets."
  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_VERSIONING_ENABLED"
  }
}

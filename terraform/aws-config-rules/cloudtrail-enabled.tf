resource "aws_config_config_rule" "cloudtrail_enabled" {
  name        = "cloudtrail-enabled"
  description = "Checks if CloudTrail is enabled in all regions"

  source {
    owner             = "AWS"
    source_identifier = "CLOUD_TRAIL_ENABLED"
  }
}

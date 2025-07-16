resource "aws_organizations_policy" "deny_cloudtrail_deletion" {
  name        = "DenyCloudTrailDeletion"
  description = "Deny deletion of CloudTrail trails"
  content     = <<EOF2
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyCloudTrailDeletion",
      "Effect": "Deny",
      "Action": [
        "cloudtrail:DeleteTrail",
        "cloudtrail:StopLogging"
      ],
      "Resource": "*"
    }
  ]
}
EOF2
}

resource "aws_organizations_policy_attachment" "attach_deny_cloudtrail" {
  policy_id = aws_organizations_policy.deny_cloudtrail_deletion.id
  target_id = data.aws_organizations_organization.current.roots[0].id
}

data "aws_organizations_organization" "current" {}

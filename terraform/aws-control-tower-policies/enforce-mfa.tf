resource "aws_organizations_policy" "enforce_mfa" {
  name        = "EnforceMFA"
  description = "Enforce MFA for IAM users"
  content     = <<EOF2
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyAllExceptListedIfNoMFA",
      "Effect": "Deny",
      "NotAction": [
        "iam:CreateVirtualMFADevice",
        "iam:EnableMFADevice",
        "iam:GetUser",
        "iam:ListMFADevices",
        "iam:ListVirtualMFADevices",
        "iam:ResyncMFADevice",
        "sts:GetSessionToken"
      ],
      "Resource": "*",
      "Condition": {
        "BoolIfExists": {
          "aws:MultiFactorAuthPresent": "false"
        }
      }
    }
  ]
}
EOF2
}

resource "aws_organizations_policy_attachment" "attach_enforce_mfa" {
  policy_id = aws_organizations_policy.enforce_mfa.id
  target_id = data.aws_organizations_organization.current.roots[0].id
}

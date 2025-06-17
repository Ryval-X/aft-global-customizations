resource "aws_organizations_policy" "deny_vpc_flow_logs" {
  name    = "DenyVpcFlowLogs"
  content = file("${path.module}/policies/deny-vpc-flow-logs.json")
  type    = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "attach_deny_vpc_flow_logs" {
  policy_id = aws_organizations_policy.deny_vpc_flow_logs.id
  target_id = var.target_ou_id
}

resource "aws_organizations_policy" "deny_unencrypted_rds" {
  name    = "DenyUnencryptedRDS"
  content = file("${path.module}/policies/deny-unencrypted-rds.json")
  type    = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "attach_deny_unencrypted_rds" {
  policy_id = aws_organizations_policy.deny_unencrypted_rds.id
  target_id = var.target_ou_id  # Set this to your OU or account ID
}

locals {
  role_robot_allowed_policies = [
    aws_iam_policy.s3_management.arn, 
    aws_iam_policy.dynamodb_management.arn
  ]
}
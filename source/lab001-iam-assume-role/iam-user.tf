resource "aws_iam_user" "robot" {
  name = "robot"
  path = "/auto/"

  tags = {
    Name = "robot"
  }
}

# 設定 AssumeRole 的 IAM Policy
# 讓 IAM User 可以切換到指定的 IAM Role
resource "aws_iam_user_policy" "assume_role-robot" {
  name = "assume_role-robot"
  user = aws_iam_user.robot.name

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "${aws_iam_role.robot.arn}"
        }
    ]
  }
  EOF
}
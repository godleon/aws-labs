# 建立 instance profile，才能讓 IAM Role 套用在 EC2 instance 上
resource "aws_iam_instance_profile" "profile-robot" {
  name = "profile-robot"
  role = aws_iam_role.robot.name
}

# 若是想要接受特定 root user 下的所有 IAM User 都可以 AssumeRole
# Principal 的部份可以改成類似 => "AWS": "arn:aws:iam::777777777777:root"
resource "aws_iam_role" "robot" {
  name = "robot"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }, 
    {
        "Effect": "Allow",
        "Principal": { 
            "AWS": "${aws_iam_user.robot.arn}"
        },
        "Action": "sts:AssumeRole",
        "Condition": {}
    }
  ]
}
EOF

  tags = {
    Name = "robot"
  }
}

resource "aws_iam_role_policy_attachment" "robot-s3_management" {
  role       = aws_iam_role.robot.name
  policy_arn = aws_iam_policy.s3_management.arn
}
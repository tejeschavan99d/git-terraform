resource "aws_iam_role" "ec2_s3_role" {
  name = "ec2_s3_role"
  max_session_duration = 3600
  assume_role_policy = jsonencode({
    Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Sid = ""
            Principal = {
                Service = "ec2.amazonaws.com"
            }
        }
    ]
  })
  tags = {
    name = "${var.app}-${var.env}-role"
  }
}

resource "aws_iam_policy" "ec2s3policy" {
  name = "ec2s3policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            Effect = "Allow"
            Resource = "*"
            Action = [
                "s3:GetObject",
                "s3:ListBucket",
                "s3:ListAllMyBuckets"
            ]
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "policy_attach" {
  role = aws_iam_role.ec2_s3_role.name
  policy_arn = aws_iam_policy.ec2s3policy.arn
}

resource "aws_iam_instance_profile" "ec2profile" {
  name = "ec2_s3_iam_role_profile"
  role = aws_iam_role.ec2_s3_role.name
}


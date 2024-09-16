resource "aws_iam_user" "s3_user" {
  name = "s3_user"
  tags = {
    Name = "s3_user"
  }
}

resource "aws_iam_access_key" "s3_user_access_key" {
  user = aws_iam_user.s3_user.name
}

data "aws_iam_policy_document" "s3_access_policy" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.main.id}",
      "arn:aws:s3:::${aws_s3_bucket.main.id}/*"
    ]

    effect = "Allow"
  }
}

resource "aws_iam_user_policy" "s3_user_policy" {
  name   = "s3_read_write_policy"
  user   = aws_iam_user.s3_user.name
  policy = data.aws_iam_policy_document.s3_access_policy.json
}

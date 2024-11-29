# iam.tf
resource "aws_iam_role" "polly_access" {
  name = "podcast-converter-polly-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "polly_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonPollyFullAccess"
  role       = aws_iam_role.polly_access.name
}
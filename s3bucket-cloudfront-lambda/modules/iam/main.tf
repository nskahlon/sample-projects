terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}
data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
# Attach above policy to the Role
resource "aws_iam_role" "lambda_role" {
  name               = var.rolename
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy
}

# Attach a Managed Policy to the Role
resource "aws_iam_role_policy_attachment" "s3read_role_policy_attachment" {
  role       = aws_iam_role.lambda_role
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

# Attach a Managed Policy to the Role
resource "aws_iam_role_policy_attachment" "lambdabasic_role_policy_attachment" {
  role       = aws_iam_role.lambda_role
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdabasicExecutionRole"
}
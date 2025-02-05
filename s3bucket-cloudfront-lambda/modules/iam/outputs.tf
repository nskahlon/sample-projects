output "lambda_role_arn" {
    description = "ARN of the created role for lambda function"
    value = aws_iam_role.lambda_role.arn
  
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  function_name = "lambda_function_name"
  role          = var.lambda_role_name
  runtime = "java17"

  environment {
    variables = {
      foo = "bar"
    }
  }
}
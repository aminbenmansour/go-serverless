resource "aws_cloudwatch_log_group" "go_serverless" {
  name = "/aws/lambda/${aws_lambda_function.go_serverless.function_name}"

  retention_in_days = 30
}

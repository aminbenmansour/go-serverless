resource "aws_cloudwatch_log_group" "go_serverless" {
  name = "/aws/lambda/${aws_lambda_function.go_serverless.function_name}"

  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "api_gw" {
  name = "/aws/api_gw/${aws_apigatewayv2_api.lambda.name}"

  retention_in_days = 30
}
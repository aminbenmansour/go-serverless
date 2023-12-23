resource "aws_apigatewayv2_api" "lambda" {
  name          = "serverless_lambda_gw"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "lambda" {
  api_id = aws_apigatewayv2_api.lambda.id

  name        = "serverless_lambda_stage"
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "go_serverless" {
  api_id = aws_apigatewayv2_api.lambda.id

  integration_uri    = aws_lambda_function.go_serverless.invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

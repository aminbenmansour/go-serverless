resource "aws_lambda_function" "go_serverless" {
  function_name = "go-serverless"

  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key    = aws_s3_object.lambda_go_serverless.key

  runtime = "go1.x"
  handler = "main.handler"

  source_code_hash = data.archive_file.lambda_go_serverless.output_base64sha256

  role = aws_iam_role.lambda_exec.arn
}

data "archive_file" "lambda_go_serverless" {
  type = "zip"

  source_dir  = "${path.module}/go-serverless"
  output_path = "${path.module}/go-serverless.zip"
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "amin_lambda_go_serverless"
}

resource "aws_s3_object" "lambda_go_serverless" {
  bucket = aws_s3_bucket.lambda_bucket.id

  key    = "go-serverless.zip"
  source = data.archive_file.lambda_go_serverless.output_path

  etag = filemd5(data.archive_file.lambda_go_serverless.output_path)
}
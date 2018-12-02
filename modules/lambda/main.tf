module "permissions" {
  source = "../iam"
  name   = "${local.name}"
}

resource "aws_lambda_function" "lambda" {
  filename         = "${local.src_archive}"
  function_name    = "${local.name}"
  role             = "${module.permissions.role_arn}"
  handler          = "${local.handler}"
  source_code_hash = "${local.hash}"
  runtime          = "${local.runtime}"

  environment {
    variables = "${local.env}"
  }

  tags = "${local.tags}"
}

module "http" {
  source               = "../api_gateway"
  lambda_name          = "${aws_lambda_function.lambda.function_name}" // use reference instead of the variable for proper dependency
  path                 = "${local.http_path}"
  lambda_invoke_arn    = "${aws_lambda_function.lambda.invoke_arn}"
}
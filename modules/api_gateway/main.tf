resource "aws_api_gateway_rest_api" "lambda" {
  name        = "${local.lambda_name}"
  description = "${local.description}"
}

resource "aws_lambda_permission" "lambda_invoke_permission" {
  statement_id  = "AllowInvoke${title(local.lambda_name)}Function"
  action        = "lambda:InvokeFunction"
  function_name = "${local.lambda_name}"
  principal     = "apigateway.amazonaws.com"

  # The /*/*/* part allows invocation from any stage, method and resource path
  # within API Gateway REST API.
  source_arn = "${aws_api_gateway_rest_api.lambda.execution_arn}/*/*/*"
}

resource "aws_api_gateway_resource" "default" {
  rest_api_id = "${aws_api_gateway_rest_api.lambda.id}"
  parent_id   = "${aws_api_gateway_rest_api.lambda.root_resource_id}"
  path_part   = "${local.path}"
}

resource "aws_api_gateway_method" "resource_method_get" {
  rest_api_id   = "${aws_api_gateway_rest_api.lambda.id}"
  resource_id   = "${aws_api_gateway_resource.default.id}"
  http_method   = "${local.method}"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = "${aws_api_gateway_rest_api.lambda.id}"
  resource_id             = "${aws_api_gateway_resource.default.id}"
  http_method             = "${aws_api_gateway_method.resource_method_get.http_method}"
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${local.lambda_invoke_arn}"
}

resource "aws_api_gateway_deployment" "default" {
  depends_on  = ["aws_api_gateway_integration.integration"]
  rest_api_id = "${aws_api_gateway_rest_api.lambda.id}"
  stage_name  = "${local.stage_name}"
}

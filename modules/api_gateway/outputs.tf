output "endpoint" {
  value = "${aws_api_gateway_deployment.default.invoke_url}/${local.path}"
}
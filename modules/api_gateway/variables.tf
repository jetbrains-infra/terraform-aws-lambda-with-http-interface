variable "lambda_name" {}
variable "description" {
  default = "Lambda invokation interface"
}
variable "path" {}
variable "method" {
  default = "GET"
}
variable "lambda_invoke_arn" {}
variable "stage_name" {
  default = "v1"
}

locals {
  lambda_name          = "${var.lambda_name}"
  description          = "${var.description}"
  path                 = "${var.path}"
  method               = "${var.method}"
  lambda_invoke_arn    = "${var.lambda_invoke_arn}"
  stage_name           = "${var.stage_name}"
}
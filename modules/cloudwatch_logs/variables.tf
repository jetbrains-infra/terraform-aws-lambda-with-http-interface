variable "name" {}
variable "retention_period" {
  default = 7
}

locals {
  lambda_name = "${var.name}"
  retention_period = "${var.retention_period}"
}
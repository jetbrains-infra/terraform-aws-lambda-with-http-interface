variable "src_archive" {}
variable "name" {}
variable "handler" {}
variable "hash" {}
variable "runtime" {}
variable "http_path" {}
variable "env" {
  type    = "map"
}
variable "tags" {
  type    = "map"
}

locals {
  src_archive = "${var.src_archive}"
  name        = "${var.name}"
  handler     = "${var.handler}"
  hash        = "${var.hash}"
  runtime     = "${var.runtime}"
  env         = "${var.env}"
  tags        = "${var.tags}"
  http_path   = "${var.http_path}"
}
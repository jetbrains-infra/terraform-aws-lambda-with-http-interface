variable "project" {}
variable "function_name" {}
variable "path_to_src_archive" {}
variable "runtime" {
  description = ""
}
variable "handler" {}
variable "http_path" {}
variable "env" {
  type    = "map"
  default = {}
}
variable "tags" {
  type    = "map"
  default = {}
}

locals {
  name        = "${replace(title(var.function_name), " ", "")}"
  project     = "${var.project}"
  src_archive = "${var.path_to_src_archive}"
  hash        = "${base64sha256(file(var.path_to_src_archive))}"
  runtime     = "${var.runtime}"
  handler     = "${var.handler}"
  http_path   = "${var.http_path}"
  env         = "${var.env}"
  tags        = "${merge(var.tags, map("Project", "${var.project}"))}"
}
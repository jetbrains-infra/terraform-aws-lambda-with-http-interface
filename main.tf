module "log_storage" {
  source = "modules/cloudwatch_logs"
  name   = "${local.name}"
}

module "lambda" {
  source      = "modules/lambda"
  src_archive = "${local.src_archive}"
  hash        = "${local.hash}"
  runtime     = "${local.runtime}"
  handler     = "${local.handler}"
  name        = "${local.name}"
  env         = "${local.env}"
  tags        = "${local.tags}"
  http_path   = "${local.http_path}"
}
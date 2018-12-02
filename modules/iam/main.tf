data "aws_iam_policy_document" "lambda" {
  statement {
    actions = ["sts:AssumeRole"],
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "lambda" {
  name = "${local.name}Lambda"
  assume_role_policy = "${data.aws_iam_policy_document.lambda.json}"
}

resource "aws_iam_role_policy_attachment" "allow_lambda_write_logs" {
  role = "${aws_iam_role.lambda.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "archive_file" "payload" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "build/payload.zip"
}

module "hello_world" {
  source                = "../../"
  function_name         = "Hello World"
  http_path             = "hello-world" // you cannot use nested path like hello/world
  runtime               = "python3.6"
  handler               = "test.my_handler"
  project               = "hello_world"
  path_to_src_archive   = "${data.archive_file.payload.output_path}"
  env                   = {
    foo = "bar",
    bar = "foo"
  }
  tags                  = {
    Test = "HelloWorld"
  }
}

output "url" {
  value = "${module.hello_world.http_endpoint}"
}
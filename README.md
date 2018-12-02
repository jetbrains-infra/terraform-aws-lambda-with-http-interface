## About
Terraform module to deploy Lambda function with one http endpoint. 


### Params 
* `project` - Project name, used as tag for objects.
* `function_name` - Lambda function name.
* `path_to_src_archive` - Path to zip archive with a source of the function.
* `runtime` - The runtime version for the function. See [AWS documentation](https://docs.aws.amazon.com/lambda/latest/dg/API_CreateFunction.html#SSS-CreateFunction-request-Runtime) for proper value.
* `handler` - The name of the method within your code that Lambda calls to execute your function.
* `http_path` - The endpoint of Lambda function. You cannot use nested paths (`hello/world` e.g.). 

### Optional params with default values
* `env` - Map of environment variables and their values (Default: `{}`) 
* `tags` - Map of tags and their values (Default: `{}`)

## Usage

See examples.

## Outputs

* `http_endpoint` - endpoint for deployed Lambda
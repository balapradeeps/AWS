# dev-requirements
- "https://github.com/dancrumb/generator-serverless-policy"

# Set up your credentials
- run `sls configure --key <my_key> --secret <my_secret>`

# Usage
- `yo serverless-policy` to generate the minimal policy
- `serverless deploy` to deploy infra
- `serverless invoke -f <my_function>` to test a deployed function
- `serverless remove` to remove infra

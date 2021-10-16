# dev-requirements
- "https://github.com/dancrumb/generator-serverless-policy"

#### Configure credentials
- `sls configure --key <my_key> --secret <my_secret>`

# Usage
- `my_serverless deploy` to deploy infra
- `my_serverless remove` to remove infra
#### Deployment failure
Deployment can fail if the cloud formation instance is in maintenance state. In that case,
you need to manually delete generated IAM roles before redeploying.

# Dev
### test deployed lambda
- `my_serverless invoke -f <my_function>`
### test localy
- `my_serverless invoke local -f <my_function> -p <my_event_data.json> -c <my_context_data.json>`

# SDK references
aws sdk Developer Guide
```https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/examples.html```
aws sdk Documentation
```https://docs.aws.amazon.com/sdk-for-ruby/v2/api/```
mongodb sdk Documentation
```https://www.rubydoc.info/gems/mongo/Mongo/Collection```

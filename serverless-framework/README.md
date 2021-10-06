# dev-requirements
- "https://github.com/dancrumb/generator-serverless-policy"

# Installation

## Install dependancies
- `apt-get install ruby-full`
- `gem install bundle`
- `bundle install` in the same directory of Gemfile
- `gem install ox`
- `gem install aws-sdk`
- `apt-get install npm`
- `npm install -g serverless`

## Configure
#### Configure credentials
- `sls configure --key <my_key> --secret <my_secret>`

# Usage
- `serverless deploy` to deploy infra
- `serverless remove` to remove infra

# Dev
### Generate policies for lambdas
- `yo serverless-policy`
### test deployed lambda
- `serverless invoke -f <my_function>`
### test localy
- `serverless invoke local -f <my_function> -p <my_event_data.json> -c <my_context_data.json>`

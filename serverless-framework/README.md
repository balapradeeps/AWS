# dev-requirements
- "https://github.com/dancrumb/generator-serverless-policy"

# Installation

## Install dependancies
- `apt-get install ruby-full`
- `gem install bundle`
- `bundle install` in the same directory of Gemfile
- `apt-get install npm`
- `npm install -g serverless`

## Configure
#### Configure credentials
- `sls configure --key <my_key> --secret <my_secret>`

# Usage
- `yo serverless-policy` to generate the minimal policy
- `serverless deploy` to deploy infra
- `serverless invoke -f <my_function>` to test a deployed function
- `serverless invoke local -f <my_function>` to test a local function
- `serverless remove` to remove infra

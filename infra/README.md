# requirements
- aws cli
- terraform cli

# Set up your configurations
- run `aws configure`
- customise `configs.tfvars`

# Usage
```terraform plan -var-file="configs.tfvars"```

# Workflow [WIP]
#### Step 1
- create a VPC
- install documentdb in the VPC
#### Step 2
- download ssl_ca_certificate (.pem) file
- get db host url
#### Step 3
- deploy lambdas in the VPC, with the pem file
- deploy front app

# requirements
- aws cli
- terraform cli

# Set up your credentials
- run `aws configure`

# variables to set or pass
- github_pat

# Notes
The app build will be queued at AWS, but it can be long
terraform plan -var-file="configs.tfvars"

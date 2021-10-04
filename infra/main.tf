provider "aws" {
  region = "eu-west-3"
}

resource "aws_amplify_app" "front_app" {
  name         = "front"
  repository   = "https://github.com/Tiino1/serverless-webapp"
  access_token = var.github_pat

  enable_auto_branch_creation = true
  enable_branch_auto_deletion = true
  auto_branch_creation_config {
    enable_auto_build = true
  }

  platform = "WEB"

  build_spec = <<EOF
    version: 1
    applications:
      - frontend:
          phases:
            build:
              commands: []
          artifacts:
            baseDirectory: /
            files:
              - '**/*'
          cache:
            paths: []
        appRoot: front-webapp
  EOF

}

resource "aws_amplify_branch" "develop" {
  app_id            = aws_amplify_app.front_app.id
  branch_name       = "main"
  stage             = "PRODUCTION"
  enable_auto_build = true
}


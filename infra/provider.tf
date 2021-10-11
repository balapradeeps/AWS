provider "aws" {
  region = "${yamldecode(file("../env.yml"))["AMAZON_REGION"]}"
}


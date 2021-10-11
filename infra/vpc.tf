resource "aws_vpc" "main" {
  cidr_block = yamldecode(file("../env.yml"))["VPC_CIDR_BLOCK"]
  tags = {
    Name = "${yamldecode(file("../env.yml"))["VPC_NAME"]}"
  }
}

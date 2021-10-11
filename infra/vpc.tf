resource "aws_vpc" "main_vpc" {
  cidr_block = yamldecode(file("../env.yml"))["VPC_CIDR_BLOCK"]
  tags = {
    Name = yamldecode(file("../env.yml"))["VPC_NAME"]
  }
}

resource "aws_subnet" "main_subnet" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = yamldecode(file("../env.yml"))["VPC_MAIN_SUBNET"]
}

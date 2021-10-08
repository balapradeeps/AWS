resource "aws_vpc" "main" {
  cidr_block = var.VPC_CIDR_BLOCK
  tags {
    Name = var.VPC_NAME
  }
}

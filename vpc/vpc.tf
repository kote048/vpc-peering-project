resource "aws_vpc" "vpc-template" {
  cidr_block = var.vpc_cidr_block
  tags      = var.tags
}
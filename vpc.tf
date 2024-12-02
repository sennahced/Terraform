resource "aws_vpc" "vpc_adrien" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = "default"

    tags = {
        Name = "vpc_adrien"
    }
  
}
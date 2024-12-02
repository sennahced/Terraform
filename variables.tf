variable "aws_region" {
  description = "value of the region"
  default = "eu-west-2"
}
variable "availability_zones" {
  description = "value of the availability zones"
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "vpc_cidr_block" {
  description = "value of the CIDR block"
  default = "10.0.0.0/16"
}
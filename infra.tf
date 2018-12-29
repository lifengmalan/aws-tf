provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.name_vpc}"

  cidr = "${var.cidr}"

  azs             = ["${var.subnet_1}", "${var.subnet_2}", "${var.subnet_3}"]
  private_subnets = ["${var.private_subnet_1}", "${var.private_subnet_2}", "${var.private_subnet_3}"]
  public_subnets  = ["${var.public_subnet_1}", "${var.public_subnet_2}", "${var.public_subnet_3}"]

  assign_generated_ipv6_cidr_block = true
  enable_dns_hostnames = true

  enable_nat_gateway = false
  single_nat_gateway = false

  tags = {
    Owner       = "${var.owner_vpc}"
    Environment = "${var.env_vpc}"
  }

  vpc_tags = {
    Name = "${var.name_vpc}"
  }
}


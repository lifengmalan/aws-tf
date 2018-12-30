provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

# VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.name_vpc}"

  cidr = "${var.cidr}"

  azs             = ["${var.az_1}", "${var.az_2}", "${var.az_3}"]
  private_subnets = ["${var.private_subnet_1}", "${var.private_subnet_2}", "${var.private_subnet_3}"]
  public_subnets  = ["${var.public_subnet_1}", "${var.public_subnet_2}", "${var.public_subnet_3}"]
  database_subnets = ["${var.database_subnet_1}", "${var.database_subnet_2}", "${var.database_subnet_3}"]
  

  assign_generated_ipv6_cidr_block = true
  enable_dns_hostnames = true

  enable_nat_gateway = false
  single_nat_gateway = false

  tags = {
    Environment = "${var.env_vpc}"
    TerraForm = "True"
  }

  vpc_tags = {
    Name = "${var.name_vpc}"
  }
}

# Security Groups
module "sg_prod" {
  source = "terraform-aws-modules/security-group/aws"

  name = "${var.name_sg}"
  description = "${var.description_sg}"
 
  vpc_id = "${module.vpc.vpc_id}"

  use_name_prefix = "false"

  ingress_cidr_blocks = ["${var.full_cidr}"]
  ingress_rules       = "${var.in_rules}"

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]

}

module "sg_rds" {
  source = "terraform-aws-modules/security-group/aws"

  name = "${var.name_sg_rds}"
  description = "${var.description_sg_rds}"
 
  vpc_id = "${module.vpc.vpc_id}"

  use_name_prefix = "false"

  ingress_cidr_blocks = ["${var.cidr}"]
  ingress_rules       = ["mysql-tcp"] 

  egress_cidr_blocks = ["${var.cidr}"]
  egress_rules       = ["all-all"]
}

###########
# MySQL DB
###########
module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "${var.id_rds}"

  engine            = "${var.engine}"
  engine_version    = "${var.version_rds}"
  instance_class    = "${var.class_rds}"
  allocated_storage = 20
  storage_encrypted = false

  name     = "${var.name_rds}"
  username = "${var.user_rds}"
  password = "${var.password_rds}"
  port     = "${var.port_rds}"

  vpc_security_group_ids = ["${module.sg_rds.this_security_group_id}"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  multi_az = false
  backup_retention_period = 2

  # DB parameter group
  family = "${var.family_rds}"

  # DB option group
  major_engine_version = "${var.major_rds}"

  #subnet_ids = "${var.subnets}"
  subnet_ids = ["${module.vpc.database_subnets}"]
  deletion_protection = true

}

# EC2
# resource "aws_eip" "this" {
#   vpc      = true
#   instance = "${module.ec2.id[0]}"
# }

module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  instance_count = 1

  name          = "${var.name_ec2}"
  ami           = "${var.ami}"
  instance_type = "${var.type_ec2}"
  key_name      = "${var.key_ec2}"
  subnet_id     = "${element(module.vpc.public_subnets,0)}"
  vpc_security_group_ids = ["${module.sg_prod.this_security_group_id}"]
  associate_public_ip_address = true

   tags = {
    Terraform = "true"
    Environment = "prod"
    Description = "Ubuntu-Web-Ghost-Opencart-Dolibarr"
   }
}

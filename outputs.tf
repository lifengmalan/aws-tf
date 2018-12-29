# VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${module.vpc.vpc_id}"
}

# CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = ["${module.vpc.vpc_cidr_block}"]
}

# Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = ["${module.vpc.private_subnets}"]
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = ["${module.vpc.public_subnets}"]
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = ["${module.vpc.database_subnets}"]
}

# Security Groups

output "this_security_group_id" {
  description = "List of IDs of secutity group"
  value       = "${module.sg_prod.this_security_group_id}"
}
output "this_security_group_name" {
  description = "List of Name of secutity group"
  value       = "${module.sg_prod.this_security_group_name}"
}

output "this_security_group_RDS_id" {
  description = "List of IDs of secutity group for rds"
  value       = "${module.sg_rds.this_security_group_id}"
}
output "this_security_group_name_RDS" {
  description = "List of Name of secutity group for rds"
  value       = "${module.sg_rds.this_security_group_name}"
}

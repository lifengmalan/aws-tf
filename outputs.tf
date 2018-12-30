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

# RDS
output "this_db_instance_address" {
  description = "The address of the RDS instance"
  value       = "${module.db.this_db_instance_address}"
}

output "this_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = "${module.db.this_db_instance_arn}"
}

output "this_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = "${module.db.this_db_instance_availability_zone}"
}

output "this_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = "${module.db.this_db_instance_endpoint}"
}

output "this_db_instance_status" {
  description = "The RDS instance status"
  value       = "${module.db.this_db_instance_status}"
}

output "this_db_instance_name" {
  description = "The database name"
  value       = "${module.db.this_db_instance_name}"
}

output "this_db_instance_username" {
  description = "The master username for the database"
  value       = "${module.db.this_db_instance_username}"
}

# EC2
output "ids" {
  description = "List of IDs of instances"
  value       = "${module.ec2.id}"
}
output "public_dns" {
  description = "List of public DNS names assigned to the instances"
  value       = "${module.ec2.public_dns}"
}
output "public_ip" {
  description = "List of public IP assigned to the instances"
  value       = "${module.ec2.public_ip}"
}
output "vpc_security_group_ids" {
  description = "List of VPC security group ids assigned to the instances"
  value       = "${module.ec2.vpc_security_group_ids}"
}

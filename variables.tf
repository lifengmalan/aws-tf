variable "access_key" {}
variable "secret_key" {}

variable "region" { default = "ap-southeast-1" }

variable "cidr" {}

# For VPC
variable "az_1" {}
variable "az_2" {}
variable "az_3" {}

variable "private_subnet_1" {}
variable "private_subnet_2" {}
variable "private_subnet_3" {}

variable "public_subnet_1" {}
variable "public_subnet_2" {}
variable "public_subnet_3" {}

variable "database_subnet_1" {}
variable "database_subnet_2" {}
variable "database_subnet_3" {}

variable "name_vpc" {}
variable "env_vpc" {}

# For Security Group
variable "name_sg" {}
variable "name_sg_rds" {}
variable "description_sg" {}
variable "description_sg_rds" {}

variable "full_cidr" { default = "0.0.0.0/0" }
variable "in_rules" { default = ["http-80-tcp", "https-443-tcp", "ssh-tcp"] }

# For RDS
variable "engine" { default = "mysql" }
variable "id_rds" {}
variable "version_rds" {}
variable "family_rds" {}
variable "major_rds" {}
variable "class_rds" {}
variable "name_rds" {}
variable "user_rds" {}
variable "password_rds" {}
variable "port_rds" { default = "3306" }

variable "access_key" {}
variable "secret_key" {}

variable "region" { default = "ap-southeast-1" }

variable "cidr" {}

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

region                = "ap-southeast-1"

cidr                  = "170.0.0.0/16"

# For VPC
az_1                  = "ap-southeast-1a"
az_2                  = "ap-southeast-1b"
az_3                  = "ap-southeast-1c"

private_subnet_1      = "170.0.1.0/24"
private_subnet_2      = "170.0.2.0/24"
private_subnet_3      = "170.0.3.0/24"

public_subnet_1       = "170.0.101.0/24"
public_subnet_2       = "170.0.102.0/24"
public_subnet_3       = "170.0.103.0/24"

database_subnet_1     = "170.0.201.0/24"
database_subnet_2     = "170.0.202.0/24"
database_subnet_3     = "170.0.203.0/24"

name_vpc              = "vpc-prod"
env_vpc               = "prod"

# For Security Groups
name_sg               = "sg_prod"
name_sg_rds           = "sg_rds_prod"
description_sg        = "Security Group"
description_sg_rds    = "Security Group for RDS"

This TerraForm template is to create AWS VPC, Security Groups, RDS and EC2 instance under AWS free tier. 
Below AWS resources will be created. All the resources are under AWS free tier.

1. VPC with 3 public subnets, 3 private subnets and 3 DB subnets.

2. One Security Group for Web Server allowing http-80, https-443 and ssh-22

3. One RDS mysqldb instance

4. One EC2 instance under AWS free tier

Usage:

1. mkdir a new directory

   sudo mkdir repo_name

2. clone the repo

   git clone -b master --single-branch https://github.com/lifengmalan/aws-tf

3. update the variables and outputs in the below files if needed.

    variables.tf
    1.auto.tfvars
    me.tfvars
    outputs.tf

4. terraform init

5. terraform plan

6. terraform apply

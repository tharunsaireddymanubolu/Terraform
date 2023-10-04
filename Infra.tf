provider "aws" {
  region = var.main_region
  shared_credentials_file = "~/.aws/credentials"
  profile = "Credentials"
}
module "vpc" {
  source = "./modules/vpc"
  region = var.main_region
}
resource "aws_instance" "example" {
  subnet_id = module.vpc.subnet_id
  ami           = module.vpc.ami_id 
  instance_type = "t2.micro"
  key_name      = "mykey"

  tags = {
    Name = "ExampleInstance"
  }
}
resource "aws_s3_bucket" "example_bucket" {
  bucket = "mybucks-01102023"  
  acl    = "private"
}

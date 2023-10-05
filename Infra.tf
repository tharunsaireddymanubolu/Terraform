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
  instance_type = "t2.medium"
  key_name      = "mykey"

  tags = {
    Name = "ExampleInstance"
  }
}
resource "aws_s3_bucket" "example_bucket" {
  bucket = "mybucks-01102023"  
  acl    = "private"
}
resource "aws_dynamodb_table" "mytable" {
  name = "Orders"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "ID"
  attribute {
    name = "ID"
    type = "N"
  }
}
resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id = module.vpc.vpc2_id
  vpc_id      = module.vpc.vpc_id

  auto_accept = true 

  tags = {
    Name = "VPC-Peering"
  }
}

resource "aws_route" "route_to_peer" {
  route_table_id         = module.vpc.route_table_id
  destination_cidr_block = module.vpc.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
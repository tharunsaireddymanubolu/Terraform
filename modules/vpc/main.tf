provider "aws" {
  region = var.region
  shared_credentials_file = "~/.aws/credentials"
  profile = "Credentials"
}
resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC1"
  }
}
resource "aws_subnet" "this" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.1.0/24"
}
resource "aws_vpc" "vpc" {
   cidr_block = "10.1.0.0/16"
   tags = {
    Name = "VPC2"
  }
}
resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.1.1.0/24"
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
  
  tags = {
    Name = "Private"
  }
}

data "aws_ssm_parameter" "this" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

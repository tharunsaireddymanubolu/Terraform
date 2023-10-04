resource "aws_instance" "K8SMaster" {
  ami           = module.vpc.ami_id 
  instance_type = "t2.micro"
  key_name      = "mykey"

  tags = {
    Name = "K8SMaster"
  }
}
resource "aws_instance" "K8SWorker1" {
  ami           = module.vpc.ami_id
  instance_type = "t2.micro"
  key_name      = "mykey"

  tags = {
    Name = "K8SWorker1"
  }
}
resource "aws_instance" "K8SWorker2" {
  ami           = module.vpc.ami_id 
  instance_type = "t2.micro"
  key_name      = "mykey"

  tags = {
    Name = "K8SWorker2"
  }
}



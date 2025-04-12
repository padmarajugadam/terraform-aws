provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "networking" {
  backend = "local" # or "s3", if you’re using remote backend
  config = {
    path = "../networking/terraform.tfstate"
  }
}
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key"
  public_key = tls_private_key.my_key.public_key_openssh
}

resource "aws_instance" "my_ec2" {
  ami                         = "ami-08c40ec9ead489470" # Ubuntu for us-east-1
  instance_type               = "t2.micro"
  subnet_id                   = data.terraform_remote_state.networking.outputs.public_subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.networking.outputs.public_sg_id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.my_key_pair.key_name

  tags = {
    Name = "public-subnet-ec2"
  }
}


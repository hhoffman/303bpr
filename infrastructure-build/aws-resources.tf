resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr
  map_public_ip_on_launch = false
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-123456" # Use the appropriate AMI for your region and Ubuntu 22.04
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id

  user_data = file("${path.module}/cloud_init.cfg")

  tags = {
    Name = "UbuntuInstance"
  }
}


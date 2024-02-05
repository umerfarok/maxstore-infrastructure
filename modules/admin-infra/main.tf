provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "maxstore_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "maxstore_vpc"
  }
}

resource "aws_subnet" "maxstore_subnet" {
  vpc_id     = aws_vpc.maxstore_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "maxstore_subnet"
  }
}

resource "aws_internet_gateway" "maxstore_gw" {
  vpc_id = aws_vpc.maxstore_vpc.id

  tags = {
    Name = "maxstore_gw"
  }
}

resource "aws_route_table" "maxstore_route_table" {
  vpc_id = aws_vpc.maxstore_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.maxstore_gw.id
  }

  tags = {
    Name = "maxstore_route_table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.maxstore_subnet.id
  route_table_id = aws_route_table.maxstore_route_table.id
}

resource "aws_security_group" "maxstore_sg" {
  name        = "maxstore_sg"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.maxstore_vpc.id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["221.120.210.181/32"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "maxstore_sg"
  }
}

data "template_file" "init" {
  template = file("./modules/admin-infra/templates/cloudinit.yaml")

  vars = {
    public_ssh_key = var.public_ssh_key
    private_ssh_key = var.private_ssh_key
  }
}

resource "aws_instance" "maxstore_instance" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.maxstore_subnet.id
  key_name      = "maxstore-root"
  security_groups = [aws_security_group.maxstore_sg.id]
  user_data = data.template_file.init.rendered
  tags = {
    Name = "maxstore_instance"
  }
}

output "instance_ip" {
  value = aws_instance.maxstore_instance.public_ip
}

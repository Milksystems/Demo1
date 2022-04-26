provider "aws" {
 region = var.region
}

resource "aws_instance" "Jenkins" {
 ami = var.ami
 instance_type = var.instance_type
 user_data = file("~/Demo1/Bash/Jenkins.sh")
 vpc_security_group_ids = [aws_security_group.Jenkins.id]
 key_name = var.key_name
 tags = {
    Name = "Jenkins"
  }
}

resource "aws_security_group" "Jenkins" {

   dynamic "ingress" {
     iterator = port
     for_each = var.ports
     content {
    from_port   = port.value
    to_port     = port.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Jenkins"
  }
}

resource "aws_instance" "Prod" {
 ami = var.ami
 instance_type = var.instance_type
 user_data = file("~/Demo1/Bash/Apache.sh")
 vpc_security_group_ids = [aws_security_group.Prod.id]
 key_name = var.key_name
 tags = {
    Name = "Prod"
  }
}

resource "aws_security_group" "Prod" {

   dynamic "ingress" {
     iterator = port
     for_each = var.ports
     content {
    from_port   = port.value
    to_port     = port.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Prod"
  }
}
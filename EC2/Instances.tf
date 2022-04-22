provider "aws" {
 region = var.region
}

resource "aws_instance" "Jenkins" {
 ami = var.ami
 instance_type = var.instance_type
 user_data = file("C:/Users/foolg/OneDrive/Desktop/Demo1/Bash/Jenkins.sh")
 vpc_security_group_ids = [aws_security_group.Jenkins.id]
 key_name = var.key_name
 tags = {
    Name = "Jenkins"
  }
}

resource "aws_security_group" "Jenkins" {

   dinamic "ingress" {
     for_each = var.ports
     content {
    from_port   = ingress.value
    to_port     = ingress.value
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
 user_data = file("C:/Users/foolg/OneDrive/Desktop/Demo1/Bash/Apache.sh")
 vpc_security_group_ids = [aws_security_group.Prod.id]
 key_name = var.key_name
 tags = {
    Name = "Prod"
  }
}

resource "aws_security_group" "Prod" {

   dinamic "ingress" {
     for_each = var.ports
     content {
    from_port   = ingress.value
    to_port     = ingress.value
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
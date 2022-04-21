provider "aws" {
 region = "eu-central-1"
}

resource "aws_instance" "Jenkins" {
 ami = "ami-0d527b8c289b4af7f"
 instance_type = "t2.micro"
 user_data = file("C:/Users/foolg/OneDrive/Desktop/Demo1/Bash/Jenkins.sh")
 vpc_security_group_ids = [aws_security_group.Jenkins.id]
 key_name = "Frankfurt2"
 tags = {
    Name = "Jenkins"
  }
}

resource "aws_security_group" "Jenkins" {

   ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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
    Name = "Jenkins"
  }
}

resource "aws_instance" "Prod" {
 ami = "ami-0d527b8c289b4af7f"
 instance_type = "t2.micro"
 user_data = file("C:/Users/foolg/OneDrive/Desktop/Demo1/Bash/Apache.sh")
 vpc_security_group_ids = [aws_security_group.Prod.id]
 key_name = "Frankfurt2"
 tags = {
    Name = "Prod"
  }
}

resource "aws_security_group" "Prod" {

   ingress { 
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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
    Name = "Prod"
  }
}
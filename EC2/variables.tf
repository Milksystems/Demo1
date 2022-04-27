variable "region" {
  default = "eu-central-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ports" {
  default = ["80", "8080", "22"]
}

variable "key_name" {
  default = "Frankfurt2"
}

data "aws_ami" "ubuntu" {
  owners           = ["099720109477"]
  most_recent      = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}
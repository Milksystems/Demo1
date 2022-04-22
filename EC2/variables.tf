variable "region" {
  default = "eu-central-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-0d527b8c289b4af7f"
}

variable "ports" {
  default = ["80", "8080", "22"]
}

variable "key_name" {
  default = "Frankfurt2"
}
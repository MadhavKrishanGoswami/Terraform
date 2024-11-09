terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "myserver" {
  ami           = "ami-04b54ebf295fe01d7"
  instance_type = "t3.micro"

  tags = {
    Name = "Sample Server"
  }

}

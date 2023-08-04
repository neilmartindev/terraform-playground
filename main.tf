terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_security_group" "testing-access" {
  name        = "testing"
  description = "testing access to instances"

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
}

resource "aws_instance" "ssh-test" {
  ami                    = "ami-0eb260c4d5475b901" # Ubuntu in eu-west-2 
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.testing-access.id]
}
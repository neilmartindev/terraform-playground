terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}
resource "aws_instance" "example" {
  ami         = "ami-0f58f0da665c8221f"
  instance_type = "t2.micro"
}
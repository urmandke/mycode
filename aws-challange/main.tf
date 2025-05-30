terraform {
  required_providers {
    aws = {
      # short for registry.terraform.io/hashicorp/aws
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}


provider "aws" {
  profile = "default"
  region  = var.region
}


resource "aws_instance" "app_server" {
  # ami points to an ubuntu image (these are unique per region)
  ami           = var.ami
  # size of the machine is t2.micro
  instance_type = var.instance_type
  # tag is metadata information
  tags = {
    Name = var.name
  }
}


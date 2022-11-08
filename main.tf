terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "ca-central-1"
}

resource "aws_vpc" "noam-ezra-dev-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "noam-ezra-dev-vpc"
  }
}
resource "aws_subnet" "noam-ezra-k8s-subnet" {
  vpc_id     = aws_vpc.noam-ezra-dev-vpc.id
  cidr_block = "10.0.1.0/27"
  tags = {
    Name = "noam-ezra-dev-vpc"
  }
}
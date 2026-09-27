terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web_compute" {
    ami           = "ami-0b6d9d3d33ba97d99"
    instance_type = "t3.micro"

    tags = {
        Name = "sample1_ec2"
    }
}

resource "aws_vpc" "example" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "main_vpc" {
    cidr_block = "10.0.0.0/16"
    
    tags = {
        Name = "production"
    }
}

resource "aws_subnet" "subnet-1" {
    vpc_id     = aws_vpc.main_vpc.id
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "prod-subnet"
    }
}





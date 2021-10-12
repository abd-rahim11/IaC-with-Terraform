provider "aws" {
    region = "us-east-1"
    shared_credentials_file = "/home/abderrahim/.aws/credentials"
}


variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "avail_zone" {}
variable "env_prefix" {}
variable "my_ip" {}


resource "aws_vpc" "myapp-vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        "Name" = "${var.env_prefix}-vpc"
    }
} 

resource "aws_subnet" "myapp-subnet-1" {
   vpc_id = aws_vpc.myapp-vpc.id
   cidr_block = var.subnet_cidr_block   
   availability_zone = var.avail_zone
   tags = {
        "Name" = "${var.env_prefix}-subnet-1"
   }    
} 


resource "aws_internet_gateway" "myapp-igw" {
    vpc_id = aws_vpc.myapp-vpc.id
    tags = {
      "Name" = "${var.env_prefix}-igw"
    }
  
}

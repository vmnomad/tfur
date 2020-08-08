
terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-up-and-running-state-askar"
    key            = "workspaces-example/terraform.tfstate"
    region         = "ap-southeast-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks-askar"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "ec2" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
}

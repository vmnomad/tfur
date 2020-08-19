

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  name                = var.db_name
  username            = "admin"

  # How should we set the password?
  password            = var.db_password
  skip_final_snapshot = true
}
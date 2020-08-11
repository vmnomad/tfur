terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-up-and-running-state-askar"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-southeast-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks-askar"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"
}
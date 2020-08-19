terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-up-and-running-state-askar"
    key            = "production/datastores/mysql/terraform.tfstate"
    region         = "ap-southeast-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks-askar"
    encrypt        = true
  }
}

module "sql_db" {
    source = "../../../modules/datastores/mysql"

    db_password = var.db_password
    db_name = "${var.environment}-database"
}
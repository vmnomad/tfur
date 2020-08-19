variable "s3_bucket" {
    description = "The S3 bucket to store all states"
    type = string
    default = "terraform-up-and-running-state-askar"
}

variable "environment" {
    description = "the name of the environment"
    type = string
}
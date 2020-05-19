# terraform-modules

# create backend.tf
terraform {
  required_version = ">= 0.12"

  backend "s3" {
    bucket     = ""
    key        = "terraform_example.tfstate"
    region     = ""
    access_key = ""
    secret_key = ""
    encrypt    = "true"
  }
}

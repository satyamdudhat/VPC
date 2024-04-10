terraform {
  backend "s3" {
    bucket = "satyam-vpc-backend"
    region = "ap-south-1"
    key = "terraform.tfstate"
    profile = "satyam"
  }
}
provider "aws" {
  profile = "tf-training"
  region = "eu-central-1"
}

resource "aws_s3_bucket" "luxoft-training" {
  bucket_prefix = "luxoft-adm-025-RANDOM"
}

terraform {
  backend "s3" {
    bucket = "luxoft-terraform-YOUR-RANDOM-STRING-tf"
    key = "tf-training.tfstate"
    region = "eu-central-1"
    profile = "tf-training"
  }
}




provider "aws" {
  profile = "tf-training"
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "luxoft-terraform-YOUR-RANDOM-STRING-tf"
    key = "tf-training.tfstate"
    region = "eu-central-1"
    profile = "tf-training"
  }
}




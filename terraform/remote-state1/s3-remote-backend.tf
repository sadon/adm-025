terraform {
  backend "s3" {
    bucket = "luxoft-terraform-{%FIRSTNAME%}-{%LASTNAME%}-tf"
    key = "tf-training.tfstate"
    profile = "tf-training"
  }
}




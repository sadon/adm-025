terraform {
  backend "s3" {
    bucket = "luxoft-terraform-{%FIRSTNAME%}-{%LASTNAME%}-tf"
    # Replace by personal data
    key = "tf-training.tfstate"
    profile = "tf-training"
  }
}




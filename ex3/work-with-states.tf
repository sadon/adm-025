provider "aws" {
  profile = "tf-training"
  region = "eu-central-1"
}

resource "random_string" "test" {
  length = 10
}





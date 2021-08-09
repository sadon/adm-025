provider "aws" {
  region = "eu-central-1"

  # Authorization: Version 1:
  access_key = "..."
  secret_key = "..."

}

provider "aws" {
  region = "eu-central-1"

  # Mandatory word
  alias = "aws-second"

  # Authorization: Version 2
  profile = "tf-training"

}

resource "null_resource" "second-provider-usage-example" {
  provider = "aws.aws-second"
}

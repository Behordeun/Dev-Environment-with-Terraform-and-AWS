terraform{
    required_providers {
        aws = {
            source = "hashicorp/aws" # The source is the directory in the repo
            # version = "~> 3.0" # The version is a constraint on the version of the provider in the source.
            # Only specify a version for stability stake. Terraform will automatically update the provider.
        }
    }
}

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "vscode"
  region =  "us-east-1"
}


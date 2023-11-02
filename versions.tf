terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.15.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }

  backend "s3" {
     bucket         = "s3statebackend-emortoo-project"
     key            = "dev/terraform.tfstate"
     region         = "us-east-1"
     dynamodb_table = "state-lock"
     encrypt        = true
   }

  required_version = ">= 1.4.6"
}


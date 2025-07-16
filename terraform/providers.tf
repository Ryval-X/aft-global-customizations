provider "aws" {
  region = "us-east-1"
  # No credentials specified here as AFT will handle this
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.3.0"
}

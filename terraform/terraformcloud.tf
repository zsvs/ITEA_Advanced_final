terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.65.0"
    }
  }
  cloud {
    organization = "svs-home"

    workspaces {
      name = "final_project"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

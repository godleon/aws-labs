terraform {
  required_version = ">= 0.14.4"

  required_providers {
    aws = {
      version = ">= 3.24.1"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}
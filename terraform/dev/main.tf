terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket         = var.bucket_name
    key            = var.bucket_key
    region         = var.region
    dynamodb_table = var.dynamodb_table
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "example" {
  bucket = "tfboot-dev-test-example-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}

variable "region" {}
variable "bucket_name" {}
variable "bucket_key" {}
variable "dynamodb_table" {}

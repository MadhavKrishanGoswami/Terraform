terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "random_id" "rand-id" {
  byte_length = 8
}

resource "aws_s3_bucket" "demo-s3-bucket" {
  bucket = "madhav-demo-bucket-${random_id.rand-id.hex}"
}

resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.demo-s3-bucket.bucket
  source = "./myfile.txt"
  key    = "mydata.txt"
}

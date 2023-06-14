provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = var.bucket_name
  tags = {
    Name = "${var.bucket_tag}"
  }
}

resource "aws_s3_bucket_ownership_controls" "demo_ownership_control" {
  bucket = aws_s3_bucket.demo_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "demo_public_access" {
  bucket = aws_s3_bucket.demo_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "demo_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.demo_ownership_control,
    aws_s3_bucket_public_access_block.demo_public_access,
  ]

  bucket = aws_s3_bucket.demo_bucket.id
  acl    = var.acl_value
}

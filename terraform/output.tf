output "bucket_name" {
  value = aws_s3_bucket.demo_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.demo_bucket.arn
}

output "bucket_region" {
  value = aws_s3_bucket.demo_bucket.region
}

output "bucket_id" {
  value = aws_s3_bucket.demo_bucket.id
}

output "s3_bucket" {
  value =  {
    s3_bucket_name = aws_s3_bucket.bucket.bucket
  }
}
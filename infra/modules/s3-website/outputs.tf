output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "bucket_id" {
  value = aws_s3_bucket.this.id
}

output "website_domain" {
  value = aws_s3_bucket_website_configuration.this.website_domain
}
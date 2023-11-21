output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "bucket_domain_name" {
  value = aws_s3_bucket.this.bucket_domain_name
}

output "bucket_id" {
  value = aws_s3_bucket.this.id
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.this.website_endpoint
}

output "website_domain" {
  value = aws_s3_bucket_website_configuration.this.website_domain
}
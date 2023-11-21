data "terraform_remote_state" "bucket" {
  backend = "s3"
  config = {
    bucket = var.bucket_name_backup
    key    = "/terraform/state"
    region = var.region
  }
}


data "aws_s3_bucket" "thisbucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket" "this" {
  bucket = data.aws_s3_bucket.thisbucket.id

  tags = {
    Name        = var.bucket_name # My lovely website"
    Terraform   = "True"
  }
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_http_access" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.allow_website_access.json
}

data "aws_iam_policy_document" "allow_website_access" {
  statement {
    actions = [
      "s3:GetObject",
    ]

    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*",
    ]
  }
}
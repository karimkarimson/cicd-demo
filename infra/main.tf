module "s3-website" {
  source             = "./modules/s3-website"
  bucket_name        = var.bucket_name
  bucket_name_backup = var.bucket_name_backup
  region             = var.region
}
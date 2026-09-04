module "s3" {
  source = "./module/s3"
  bucket_name = "statefile-module2-2026-09-22"
  bucket_tags = {
    "app" = "web_app"
    "env" = "prod"
  }
}
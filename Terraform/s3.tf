resource "aws_s3_bucket" "dev_flexgateway_bucket" {
  bucket = "dev-flexgateway-s3"

  tags = {
    Name = "dev-flexgateway-s3"
  }
}

resource "aws_s3_bucket_public_access_block" "dev_flexgateway_bucket_access" {
  bucket = aws_s3_bucket.dev_flexgateway_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_flexgateway_bucket_encryption" {
  bucket = aws_s3_bucket.dev_flexgateway_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

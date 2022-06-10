resource "aws_s3_bucket" "DB-S3" {
  bucket = "RDS-snap-s3"

  tags = {
    Name        = "RDS_Snap-S3"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.DB-S3.id
  acl    = "private"
  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "log"
    enabled = true

    prefix = "log/"

    tags = {
      rule      = "log"
      autoclean = "true"
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }
}
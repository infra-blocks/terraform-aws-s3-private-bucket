terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket           = var.name
  bucket_namespace = var.namespace

  tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_s3_bucket_ownership_controls" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    dynamic "apply_server_side_encryption_by_default" {
      for_each = var.default_encryption_kms_key_arn != null ? [0] : []

      content {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = var.default_encryption_kms_key_arn
      }
    }

    dynamic "apply_server_side_encryption_by_default" {
      for_each = var.default_encryption_kms_key_arn != null ? [] : [0]

      # This type of encryption is enabled by AWS by default now. We keep it here mainly for clarity.
      content {
        sse_algorithm = "AES256"
      }
    }

    bucket_key_enabled = var.default_encryption_kms_key_arn != null
  }
}

resource "aws_s3_bucket_versioning" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_policy" "policy" {
  count = var.policy != null ? 1 : 0

  bucket = aws_s3_bucket.bucket.id
  policy = var.policy
}

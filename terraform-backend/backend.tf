resource "aws_s3_bucket" "bucket" {
  bucket = "s3statebackend-emortoo-project"
}

resource "aws_s3_bucket_versioning" "mybucket" {
  bucket = aws_s3_bucket.bucket.bucket

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "mybucket" {
  bucket = aws_s3_bucket.bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#Create dynamodb
resource "aws_dynamodb_table" "table" {
  name           = "state-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

/* resource "aws_s3_bucket" "ADbucket" {
    bucket = "adrienbucket"
    tags = {
        Name = "adrienbucket"
    }
}
resource "aws_s3_bucket_versioning" "bucket_versioning" {
    bucket = aws_s3_bucket.ADbucket.id
    versioning_configuration {
        status = "Enabled"
    }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_SSEC" {
  bucket = aws_s3_bucket.ADbucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
resource "aws_s3_bucket_object_lock_configuration" "bucket_object_lock" {
  bucket = aws_s3_bucket.ADbucket.id
    object_lock_enabled = "Enabled"
}

resource "aws_dynamodb_table" "dynamodb_table" {
  name = "ad-dynamodb-table"
  read_capacity = 5
  write_capacity = 5
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "ad-dynamodb-table"
  }
} */
resource "aws_s3_bucket" "pass_example" {
  bucket = "test_bucket"
  acl = "private"

  versioning {
    enabled = false
  }
  logging {
    target_bucket = "bucket-name"
  }

}

resource "aws_s3_bucket_public_access_block" "pass_example" {
  bucket = aws_s3_bucket.pass_example.id

  block_public_policy = false
  block_public_acls = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

provider "aws" {
 region = "us-east-2"
}
resource "aws_s3_bucket" "myterraform-bucket1" {
  bucket = "myterraform-bucket1"
  acl    = "private"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
  tags = {
    Name        = "My bucket"
  }
}
resource "aws_s3_bucket_object" "object" {

  bucket = aws_s3_bucket.myterraform-bucket1.id

  key    = "file"

  acl    = "private"  # or can be "public-read"

  source = "/var/www/html/resetPassword.php"

} 
 

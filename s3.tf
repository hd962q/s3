provider "aws" {
 region = "us-east-2"
}
resource "aws_s3_bucket" "terraform-bucket1" {
  bucket = "my-tf-test-bucket"
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
  
 

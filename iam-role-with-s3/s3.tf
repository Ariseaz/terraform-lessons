resource "aws_s3_bucket" "b" {
  bucket = "azbucket-c29df1"
  acl    = "private"

  tags = {
    Name = "azbucket-c29df1"
  }
}


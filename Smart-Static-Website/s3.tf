resource "aws_s3_bucket" "sw-ef-2025" {
    bucket = "sw-bucket-2004"
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.sw-ef-2025.id 

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.sw-ef-2025.id 

  block_public_acls = false 
  block_public_policy = false 
  restrict_public_buckets = false 
  ignore_public_acls = false 
}

resource "aws_s3_bucket_policy" "allow_public" {
  bucket = aws_s3_bucket.sw-ef-2025.id 
  depends_on = [aws_s3_bucket_public_access_block.public_access_block]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = "*"
      Action = ["s3:GetObject"]
      Resource = ["${aws_s3_bucket.sw-ef-2025.arn}/*"]
    }]
  })
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.sw-ef-2025.id 
  key = "index.html"
  source = "${path.module}/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.sw-ef-2025.id 
  key = "error.html"
  source = "${path.module}/error.html"
  content_type = "text/html"
}
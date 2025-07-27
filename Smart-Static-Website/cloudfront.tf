resource "aws_cloudfront_origin_access_identity" "oai" {
    comment = "Access S3 from Cloudfront"
}

resource "aws_cloudfront_distribution" "cdn" {
  provider = aws.us_east_1 
  web_acl_id = aws_wafv2_web_acl.example.arn  
    origin {
        domain_name = aws_s3_bucket.sw-ef-2025.bucket_regional_domain_name
        origin_id = "s3-origin"

        s3_origin_config {
          origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
        }
    }

    enabled = true
    is_ipv6_enabled = true
    comment = "CDN for static website"
    default_root_object = "index.html"

    default_cache_behavior {
      allowed_methods = ["GET", "HEAD"]
      cached_methods = ["GET", "HEAD"]
      target_origin_id = "s3-origin"

      forwarded_values {
        query_string = false
        cookies {
            forward = "none"
        }
      }

      viewer_protocol_policy = "redirect-to-https"
      min_ttl = 0
      default_ttl = 3600
      max_ttl = 86400
    }

    restrictions {
      geo_restriction {
        restriction_type = "none"
      }
    }

    viewer_certificate {
      cloudfront_default_certificate = true
    }

    tags = {
        Enviroment = "production"
    }
}
resource "aws_acm_certificate" "cert" {
    domain_name = "example.click"
    validation_method = "DNS"

    tags = {
        Name = "Test"
    }
}


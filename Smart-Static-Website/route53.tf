resource "aws_route53_zone" "primary" {
    name = "example.click"
}

resource "aws_route53_record" "example_cname" {
    zone_id = aws_route53_zone.primary.zone_id 
    name = "www.example.click"
    type = "CNAME"
    ttl = 300
    records = ["example.click"]
}
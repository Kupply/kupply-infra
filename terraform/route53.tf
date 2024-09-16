resource "aws_route53_zone" "kupply" {
  name = "kupply.com"
}

resource "aws_route53_record" "frontend_record" {
  zone_id = aws_route53_zone.kupply.zone_id
  name    = "kupply.com"
  type    = "A"
  ttl     = "300"

  records = [aws_instance.main.public_ip]
}

resource "aws_route53_record" "backend_record" {
  zone_id = aws_route53_zone.kupply.zone_id
  name    = "api.kupply.com"
  type    = "A"
  ttl     = "300"

  records = [aws_instance.main.public_ip]
}

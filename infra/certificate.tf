resource "tls_private_key" "default" {
    algorithm = "RSA"
}

resource "tls_self_signed_cert" "default" {
    key_algorithm = "RSA"
    private_key_pem = tls_private_key.default.private_key_pem

    subject {
        common_name = "sigl-gwaihir.com"
        organization = "SIGLHF inc."
    }

    allowed_uses = [
        "key_encipherment",
        "digital_signature",
        "server_auth"
    ]

    validity_period_hours = 72
}

resource "aws_acm_certificate" "db_cert" {
    private_key = tls_private_key.default.private_key_pem
    certificate_body = tls_self_signed_cert.default.cert_pem
}

/*
resource "aws_route53_zone" "route53" {
    name = "sigl-gwaihir.com"
    force_destroy = true
}

resource "aws_route53_record" "db_cert_domain_validation" {
    name = tolist(aws_acm_certificate.db_cert.domain_validation_options).0.resource_record_name
    type = tolist(aws_acm_certificate.db_cert.domain_validation_options).0.resource_record_type
    zone_id = resource.aws_route53_zone.route53.zone_id
    records = [tolist(aws_acm_certificate.db_cert.domain_validation_options).0.resource_record_type]
    ttl = 60
}

resource "aws_acm_certificate_validation" "default" {
    certificate_arn = aws_acm_certificate.db_cert.arn
    validation_record_fqdns = [aws_route53_record.db_cert_domain_validation.fqdn]
}
*/
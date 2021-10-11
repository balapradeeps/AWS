resource "aws_ssm_parameter" "main_subnet" {
    name = "/subnet/id"
    description = "Endpoint to access the main subnet id to put lamdas in the same subnet"
    type = "String"
    value = aws_subnet.main_subnet.id
}

resource "aws_ssm_parameter" "db_dns_address" {
    name = "/db/dns_address"
    description = "Endpoint to access database DNS address to make lambdas find the DB"
    type = "String"
    value = aws_docdb_cluster.database_cluster.endpoint
}

resource "aws_ssm_parameter" "db_certificate" {
    name = "/db/certificate"  
    description = "Endpoint to access DB certificate to authorize lambdas actions in the DB"
    type = "SecureString"
    value = tls_self_signed_cert.default.cert_pem
}

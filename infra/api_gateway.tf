resource "aws_apigatewayv2_api" "gateway" {
  name          = "nlpf_gateway"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "stage_resource" {
  api_id      = aws_apigatewayv2_api.gateway.id
  name        = "nlpf_gateway_stage"
  auto_deploy = true
}
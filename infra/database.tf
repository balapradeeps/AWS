resource "aws_dynamodb_table" "database" {
  name = "nlpf_db"

  billing_mode = "PROVISIONED"
  write_capacity = 1
  read_capacity = 1

  hash_key = "id"
  attribute {
    name = "id"
    type = "N"
  }
}


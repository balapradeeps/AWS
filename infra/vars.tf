/*
variable "GITHUB_PAT" {
  type = string
  default = "${yamldecode(file("../env.yml"))["GITHUB_PAT"]}"
  sensitive = true
}

variable "app_name" {
  type    = string
  default = "serverless-webapp"
}


variable "DB_USER_NAME" {
  type = string
  default = "${yamldecode(file("../env.yml"))["DB_USER_NAME"]}"
}

variable "DB_USER_PASSWORD" {
  type = string
  default = "${yamldecode(file("../env.yml"))["DB_USER_PASSWORD"]}"
  sensitive = true
}


variable "DB_PORT" {
  type    = number
  default = "${yamldecode(file("../env.yml"))["DB_PORT"]}"
}

variable "VPC_CIDR_BLOCK" {
  type    = string
  default = "${yamldecode(file("../env.yml"))["VPC_CIDR_BLOCK"]}"
}

variable "VPC_NAME" {
  type    = string
  default = "${yamldecode(file("../env.yml"))["VPC_NAME"]}"
}

*/
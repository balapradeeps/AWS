variable "github_pat" {
  type = string
}

variable "app_name" {
  type    = string
  default = "serverless-webapp"
}

variable "DB_ADMIN_USERNAME" {
  type = string
}

variable "DB_ADMIN_PASSWORD" {
  type = string
}

variable "DB_PORT" {
  type    = number
  default = 27017
}

variable "VPC_CIDR_BLOCK" {
  type    = string
  default = "10.0.0.0/16"
}

variable "VPC_NAME" {
  type    = string
  default = "main"
}

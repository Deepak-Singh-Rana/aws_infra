variable "primary_region" {
  description = "AWS Region"
}

variable "common_tags" {
  type = map(string)
}

variable "zone" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "appsgs" {
  type = list(string)
}

variable "websgs" {
  type = list(string)
}

variable "appsg_ports" {
  type = list(number)
}

variable "websg_ports" {
  type = list(number)
}



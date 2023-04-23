variable "primary_region" {
  description = "AWS Region"
}

variable "common_tags" {
  type = map(string)
}

variable "zone" {
  type = string
}

variable "cidr" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "ec2_conf" {
  default = [{}]
}

variable "region" {
  description = "AWS Region"
}

variable "instance_type_web" { 
}

variable "instance_type_app" {
}

variable "count_webserver" {
  type    = number
}

variable "count_appserver" {
  type    = number
}

variable "app_name" {
  type    = string
}


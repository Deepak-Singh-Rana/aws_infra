variable "region" {
  description = "AWS Region"
}

variable "instance_type_web" { 
}

variable "instance_type_app" {
}

variable "webserver_count" {
  type    = number
}

variable "appserver_count" {
  type    = number
}

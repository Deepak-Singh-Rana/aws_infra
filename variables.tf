variable "primary_region" {
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


variable "common_tags" {
  type        = map(string)
}

variable "zone" {
  type    = string
}

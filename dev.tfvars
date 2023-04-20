primary_region    = "ap-southeast-2"
instance_type_web = "t2.micro"
instance_type_app = "t2.medium"
count_webserver   = 2
count_appserver   = 2
zone              = "nonprod"
cidr              = "10.0.0.0/16"
private_subnets   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets    = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]


common_tags = {
  "env"      = "dev"
  "domain"   = "IT"
  "app_name" = "BillApp"
}



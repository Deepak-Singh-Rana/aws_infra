primary_region    = "ap-southeast-2"
instance_type_web = "t2.micro"
instance_type_app = "t2.medium"
count_webserver   = 2
count_appserver   = 2
zone              = "prod"


common_tags = {
  "env"      = "prd"
  "domain"   = "IT"
  "app_name" = "BillApp"
}

primary_region    = "ap-southeast-2"
zone              = "prod"

# VPC network
vpc_cidr          = "10.1.0.0/16"
private_subnets   = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
public_subnets    = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]

# Security group and ports
websgs            = ["aws_security_group.websg"]
appsgs            = ["aws_security_group.appsg"]                    
appsg_ports       = ["7015", "7025"]
websg_ports       = ["8081", "9091"]


# Common tags
common_tags = {
   "env"      = "prd"
   "domain"   = "IT"
   "app_name" = "BillApp"
}

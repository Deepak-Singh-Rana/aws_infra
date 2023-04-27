primary_region    = "ap-southeast-2"
zone              = "nonprod"

# VPC network
vpc_cidr          = "10.0.0.0/16"
private_subnets   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets    = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

# Security group and ports
websgs            = ["aws_security_group.websg"]
appsgs            = ["aws_security_group.appsg"]                    
appsg_ports       = ["7015", "7025"]
websg_ports       = ["8081", "9091"]


# Common tags
common_tags = {
   "env"      = "dev"
   "domain"   = "IT"
   "app_name" = "BillApp"
}






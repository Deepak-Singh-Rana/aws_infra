primary_region    = "ap-southeast-2"
zone              = "nonprod"
cidr              = "10.0.0.0/16"
private_subnets   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets    = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]


common_tags = {
   "env"      = "dev"
   "domain"   = "IT"
   "app_name" = "BillApp"
}


ec2_conf = [
  {
    "tier"                    = "web",
    "inst_cnt"                = "2",
    "inst_desc"              = ["Green", "Red"],
    "inst_type"               = "t2.nano",
    "subnet_id"               = "subnet-e17177a8",
#    "subnet_id"               = output.pub_subs[0],
#    "vpc_security_group_ids" = ["sg-012","sg-023"]
  },
  {
    "tier"                    = "app",
    "inst_type"               = "t2.micro",
    "inst_cnt"                = "2"
    "inst_desc"               = ["Green", "Red"],
    "subnet_id"               = "subnet-e17177a8",
#    "subnet_id"               = output.pvt_subs[1]
#    "vpc_security_group_ids" = ["sg-0123"]
  }
]



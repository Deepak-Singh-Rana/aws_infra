locals {
  tstamp = formatdate("DD-MMM-YYYY:hh-mm", timestamp())
}


/*
locals {
  ser_conf = [
    for srv in var.ec2_conf : [
      for i in range(1, srv.inst_cnt+1) : {
        instance_name = "${srv.tier}-${i}"
        instance_type = srv.inst_type
        subnet_id     = srv.subnet_id
#       security_groups = srv.vpc_security_group_ids
      }
    ]
  ]
}
*/

locals {
   listA = ["a"]
   listB = ["f"]
   all_subnets = concat(local.listA, local.listB)
}

locals {
# EC2 configuration
ec2_conf = [
  {
    "tier"                    = "web",
    "inst_cnt"                = "1",
    "inst_desc"               = ["Green", "Red"],
    "inst_type"               = "t2.nano",
#    "subnet_id"               = "public_subnets",
    "subnet_id"               = module.vpc.public_subnets.*,
#    "vpc_security_group_ids" = ["sg-012","sg-023"]
  },
  {
    "tier"                    = "app",
    "inst_type"               = "t2.micro",
    "inst_cnt"                = "1"
    "inst_desc"               = ["Green", "Red"],
#    "subnet_id"               = "private_subnets",
    "subnet_id"               = module.vpc.private_subnets.*
#    "vpc_security_group_ids" = ["sg-0123"]
  }
 ]
}



locals {
  ser_conf = [
    for srv in local.ec2_conf : [
      for i in range(1, srv.inst_cnt+1) : [
          for subnet in srv.subnet_id : {
              instance_name = "${srv.tier}-${i}-${index(local.all_subnets, subnet)}"
              instance_type = srv.inst_type
              subnet_id     = srv.subnet_id
#             security_groups = srv.vpc_security_group_ids
        }
      ]
    ]
  ]
}

locals {
  instances = flatten(local.ser_conf)
}

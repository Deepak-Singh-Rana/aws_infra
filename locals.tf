locals {
  tstamp = formatdate("DD-MMM-YYYY:hh-mm", timestamp())
}

locals {
# EC2 configuration
ec2_conf = [
  {
    "tier"        = "web",
    "inst_cnt"    = "1",
    "inst_type"   = "t2.nano",
    "subnets"     = module.vpc.public_subnets.*,
    "vpc_sg_ids"  = [aws_security_group.appsg.id, aws_security_group.websg.name]
  },
  {
    "tier"        = "app",
    "inst_type"   = "t2.micro",
    "inst_cnt"    = "2"
    "subnets"     = module.vpc.private_subnets.*,
    "vpc_sg_ids"  = [aws_security_group.appsg.id]
  }
 ]
}


locals {
  ser_conf = [
    for srv in local.ec2_conf : [
      for i in range(1, srv.inst_cnt+1) : [
          for subnet in srv.subnets : {
              instance_name   = "${srv.tier}-${i}_${index(srv.subnets, subnet)}"
              instance_type   = srv.inst_type
              subnet_id       = subnet
              security_groups = srv.vpc_sg_ids
        }
      ]
    ]
  ]
}

locals {
  instances = flatten(local.ser_conf)
}

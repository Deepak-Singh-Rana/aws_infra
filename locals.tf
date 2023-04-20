locals {
  tstamp = formatdate("DD-MMM-YYYY:hh-mm", timestamp())
}

locals {
  public_subnets  = module.vpc.public_subnet_id
  private_subnets = module.vpc.private_subnet_id

  public_instance_conf = [
    for index, subnet in local.public_subnets : [
      for i in range(var.public_instance_per_subnet) : {
        ami                    = data.aws_ami.amazon_linux_ami.id
        instance_type          = var.instance_type
        subnet_id              = subnet
        key_name               = aws_key_pair.aws_ec2_access_key.id
        vpc_security_group_ids = [aws_security_group.public_sg.id]
      }
    ]
  ]

  private_instance_conf = [
    for index, subnet in local.private_subnets : [
      for i in range(var.private_instance_per_subnet) : {
        ami                    = data.aws_ami.amazon_linux_ami.id
        instance_type          = var.instance_type
        subnet_id              = subnet
        key_name               = aws_key_pair.aws_ec2_access_key.id
        vpc_security_group_ids = [aws_security_group.private_sg.id]
      }

    ]
  ]
}

resource "aws_instance" "public_hosts" {
  for_each               = { for key, value in local.public_instance : key => value }
  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  subnet_id              = each.value.subnet_id
  key_name               = each.value.key_name
  vpc_security_group_ids = each.value.vpc_security_group_ids
  tags = {
    "Name" = "public-instance-${each.key}"
  }
}


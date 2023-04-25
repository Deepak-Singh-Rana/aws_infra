module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.zone
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.available.names
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = { CreationTime = local.tstamp }

}

/*
resource "aws_instance" "servers" {
     for_each = {for server in local.instances: server.instance_name =>  server}
  
     ami           = data.aws_ami.amazon_linux_ami.id
     instance_type = each.value.instance_type
     subnet_id     = each.value.subnet_id
     key_name      = aws_key_pair.KeyPair.key_name
#  vpc_security_group_ids = each.value.security_groups
     user_data = <<EOF
  sudo amazon-linux-extras install -y nginx1
  sudo systemctl start nginx
  EOF
     tags       = merge(var.common_tags, { Name = "${each.value.instance_name}", CreationTime = local.tstamp })
}
*/
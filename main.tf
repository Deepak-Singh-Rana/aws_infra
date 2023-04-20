module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.zone
  cidr = var.cidr

  azs             = data.aws_availability_zones.available.names
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = { CreationTime = local.tstamp }

}


/*
resource "aws_security_group" "websg" {
  description = "Web security group"
  vpc_id      = "${module.vpc.vpc_id}"

  dynamic "ingress" {
    for_each = var.websg_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.vpc_cidr]
    }
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags       = merge({ Name = "websg-${var.zone}", CreationTime = local.tstamp })
}



resource "aws_security_group" "appsg" {
  description = "App security group"
  vpc_id      = "${module.vpc.vpc_id}"

  dynamic "ingress" {
    for_each = var.appsg_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.vpc_cidr]
    }
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags       = merge({ Name = "appsg-${var.zone}", CreationTime = local.tstamp })
}
*/


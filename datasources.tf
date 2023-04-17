data "aws_ami" "amz2l_ami" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

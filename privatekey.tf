resource "tls_private_key" "SSHKey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "KeyPair" {
  key_name   = "${var.common_tags["app_name"]}-${var.common_tags["env"]}-Key"
  public_key = tls_private_key.SSHKey.public_key_openssh
  tags       = merge(var.common_tags, { Name = "${var.common_tags["app_name"]}-${var.common_tags["env"]}-Key", CreationTime = local.tstamp })
}


resource "local_file" "PrivateKey" {
  content         = tls_private_key.SSHKey.private_key_pem
  filename        = "terraform-key.pem"
  file_permission = "0400"
}


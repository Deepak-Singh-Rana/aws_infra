resource "tls_private_key" "SSHKey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "KeyPair" {
  key_name   = "${var.app_name}-TerraformKey"
  public_key = tls_private_key.SSHKey.public_key_openssh
  tags = merge(var.additional_tags, { Name = "${var.app_name}-TerraformKey"}, CreationTime = local.tstmp)
}


resource "local_file" "PrivateKey" {
  content         = tls_private_key.SSHKey.private_key_pem
  filename        = "terraform-key.pem"
  file_permission = "0400"
}

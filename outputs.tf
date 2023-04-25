output "pub_subnet" {
    value = module.vpc.public_subnets.*
}

output "pvt_subnet" {
    value = module.vpc.private_subnets.*
}

/*
output "instances" {
  value       = "${aws_instance.servers}"
  description = "EC2 details"
}
*/
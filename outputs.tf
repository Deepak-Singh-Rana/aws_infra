output "vpc_out" {
    value = module.vpc
}


output "instances" {
  value       = "${aws_instance.servers}"
  description = "EC2 details"
}

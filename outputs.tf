output "pub_subs" {
    value = module.vpc.public_subnets.*
}

output "pvt_subs" {
    value = module.vpc.private_subnets.*
}
output "instance_id" {
  value = module.aws_vpn.ec2_instance_id
}

output "public_ip" {
  value = module.aws_vpn.ec2_instance_public_ip
}

output "name" {
  value = module.aws_vpn.ec2_instance_name
}

output "availability_zone" {
  value = module.aws_vpn.ec2_instance_availability_zone
}

output "ami" {
  value = module.aws_vpn.ec2_instance_ami
}

output "instance_type" {
  value = module.aws_vpn.ec2_instance_type
}
output "instance_id" {
  value = module.ec2-wireguard-vpn.ec2_instance_id
}

output "public_ip" {
  value = module.ec2-wireguard-vpn.ec2_instance_public_ip
}

output "name" {
  value = module.ec2-wireguard-vpn.ec2_instance_name
}

output "availability_zone" {
  value = module.ec2-wireguard-vpn.ec2_instance_availability_zone
}

output "ami" {
  value = module.ec2-wireguard-vpn.ec2_instance_ami
}

output "instance_type" {
  value = module.ec2-wireguard-vpn.ec2_instance_type
}
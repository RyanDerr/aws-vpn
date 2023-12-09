module "aws_vpn" {
  source            = "../modules/vpn"
  ec2_instance_name = var.ec2_instance_name
  availability_zone = "us-east-2a"
}
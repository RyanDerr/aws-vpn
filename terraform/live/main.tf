# Modify Terraform Variables As Needed
module "aws_vpn" {
  source            = "../modules/vpn"
  ec2_instance_name = "sample-vpn"
  availability_zone = "eu-west-3a"
  local_filepath    = "../../wireguard-configs"
  devices           = "test1,test2"
}
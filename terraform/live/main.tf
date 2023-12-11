# Modify Terraform Variables As Needed
module "ec2-wireguard-vpn" {
  source            = "RyanDerr/ec2-wireguard-vpn/aws"
  version           = "0.1.1"
  ec2_instance_name = "sample-vpn"
  availability_zone = "eu-west-3a"
  local_filepath    = "../../wireguard-configs"
  devices           = "test1,test2"
}
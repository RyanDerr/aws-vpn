variable "azs" {
  description = "List of Availability Zones to be used"
  type        = list(string)
  default     = ["us-east-1a"]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.77.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = var.azs
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "my-instance"
  instance_count = 1

  ami                    = "ami-0c94855ba95c574c8" # This is an example Amazon Linux 2 AMI ID. Replace with the AMI ID you want to use.
  instance_type          = "t2.micro"
  key_name               = "my-key-pair"
  monitoring             = true
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = tolist(module.vpc.public_subnets)[0]

  tags = {
    Name        = "my-instance"
    Environment = "test"
  }
}
locals {
  tags = {
    CreatedBy = "Terraform"
    Region    = var.availability_zone
    Name      = var.ec2_instance_name
  }
}

provider "aws" {
  region = var.availability_zone != "" ? substr(var.availability_zone, 0, length(var.availability_zone) - 1) : ""
}

resource "aws_instance" "aws_vpn" {
  ami               = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  tags              = local.tags
}

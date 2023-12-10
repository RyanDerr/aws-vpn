# AWS Wireguard VPN
Terraform and shell code to provision a Wireguard VPN based on an AWS Region.

## Supported Systems
The VPN module supports the following operating systems for this Terraform configuration:
- Linux
- MacOS
- Windows Subsystem for Linux (WSL)

## Contributing Guidelines
To contribute to this project, please follow these guidelines:

1. Fork the repository and create a new branch for your contributions.
2. This repo uses [pre-commit](https://pre-commit.com/index.html) when committing to branches for Terraform validations.
Please install the Python dependency for pre-commit and run the command `pre-commit install` once you pull down the repo to automatically configure pre-commit hooks defined in `.pre-commit-config.yaml`.
3. Make your changes and ensure they adhere to the project's coding style and conventions.
4. Write clear and concise commit messages for each logical change.
5. Before submitting a pull request, run the necessary tests and ensure they pass.
6. Provide a detailed description of your changes in the pull request, including any relevant information or context.

## Prerequisites for Running as Terraform For AWS
To run this Terraform configuration, you will need to have the following prerequisites installed:
- [Terraform](https://www.terraform.io/downloads.html)

- AWS Account: You will need an AWS account to provision the VPN resources. If you don't have one, you can create a free account at [https://aws.amazon.com/free](https://aws.amazon.com/free).

- Configure Terraform to connect to AWS, to do this you can read the official [Terraform AWS Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration).

- [Wireguard VPN Connector](https://www.wireguard.com/) to provide output Wireguard config file to connect to EC2 instance.

Please ensure you have these prerequisites in place before running the Terraform configuration.

## Configuring the Terraform VPN Module
The Terraform VPN module located in this repository has the following inputs:

- `availability_zone` (optional): The AWS AZ where the VPN resources will be provisioned.
    - If not provided the module will default to `us-east-1a`.
- `ec2_instance_name` (optional): The name of the EC2 instance that will be provisioned.
    - If not provided the module will default to `terraform-vpn`.
- `instance_type` (optional): Defines the AWS EC2 instance type.
    - If not provided the module will default to `t2.micro`.
- `devices` (optional): List of comma separated devices to provide configs for AWS Wireguard VPN.
- `local_filepath` (required): The local path to store output Wireguard configs and QR codes to connect.
- `secret_key_name_location` (optional): The filepath to store and use the generated secret key used to connect to the EC2 instance.

To configure the Terraform VPN module, you need to provide values for these inputs in your Terraform configuration file.

### Example Terraform VPN Module Usage
```terraform
module "aws_vpn" {
  source            = "../modules/vpn"
  ec2_instance_name = "sample-vpn"
  availability_zone = "eu-west-3a"
  local_filepath    = "../../wireguard-configs"
  devices           = "test1,test2"
}
```

## Run Terraform & Connect
Within the directory where you Terraform code references the VPN module execute the following commands:
```shell
terraform init
terraform apply
```
### Sample Output Wireguard Conf
```
[Interface]
PrivateKey = YOUR_PRIVATE_KEY
Address = 10.0.0.2/32
ListenPort = 51820
DNS = 10.0.0.1

[Peer]
PublicKey = PEER_PUBLIC_KEY
AllowedIPs = 0.0.0.0/0
Endpoint = PEER_IP_ADDRESS:51820
```

### Final Step
Once completed you can utilized the installed Wireguard GUI with the output config file to VPN to your created EC2 instance in whatever AWS AZ provided!
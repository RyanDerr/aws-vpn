variable "ec2_instance_name" {
  description = "The name of the EC2 instance"
  type        = string
  default     = "rderr-test-vpn"

  validation {
    condition     = length(var.ec2_instance_name) >= 4
    error_message = "The EC2 instance name must be at least 4 alphanumeric characters long."
  }
}

variable "az" {
  description = "The Availability Zone to be used"
  type        = string
  default     = "us-east-1a"

  validation {
    condition     = can(regex("^us-(east|west)-[1-2][a-f]$", var.az))
    error_message = "The Availability Zone must be a US Availability Zone."
  }
}

output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the created VPC"
  value       = aws_vpc.main.cidr_block

}

output "subnet_id" {
  description = "The ID of the created subnet"
  value       = aws_subnet.main.id
}

output "vpc_az" {
  description = "The Availability Zone of the created subnet"
  value       = aws_subnet.main.availability_zone
}
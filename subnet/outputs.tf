# outputs.tf - Not currently being used
output "subnet_ids" {
  description = "IDs of the created subnets"
  value       = aws_subnet.subnet-template[*].id
}

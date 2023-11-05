#the vpc_id output is used by the subnet module
# to assocaiate the subnet to the right VPC
output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.vpc-template.id
}

#the tags output is used to pass the name of 
#the vpc (requestor or acceptor) to the subnet
output "tags" {
  description = "Name of the created VPC"
  value       = aws_vpc.vpc-template.tags_all
}
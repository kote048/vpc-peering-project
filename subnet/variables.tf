# variables.tf
variable "vpc_id" {
  description = "ID of the VPC where the subnets will be created"
  type        = string
  default     = ""
}

variable "subnet_cidr_blocks" {
  description = "List of subnet CIDR blocks"
  type        = list(string)
  default = [ "", "" ]
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IPs on launch"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the subnets"
  type        = map(string)
  default     = {
    Name  = "" 
    SecurityZone  = ""
  }
}
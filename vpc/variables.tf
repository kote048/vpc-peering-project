variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default = ""
}

variable "tags" {
  description = "Tags to apply to the VPC"
  type        = map(string)
  default     = {
    Name = ""
  }
}

# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_subnet" "subnet-template" {
  count          = length(var.subnet_cidr_blocks)
  vpc_id         = var.vpc_id
  cidr_block     = var.subnet_cidr_blocks[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch
  #Use string reference variables to assign value to tags.Name
  tags = {
    Name = "${var.tags.SecurityZone}-${data.aws_availability_zones.available.names[count.index]}"
  }
  
 
}




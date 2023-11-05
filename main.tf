#Provision acceptor VPC
module "acceptor-vpc" {
  source = "./vpc"
    tags = {
    Name  = "acceptor-vpc"   
  }
    vpc_cidr_block = "172.16.0.0/16"

}

#Provision requestor VPC
module "requestor-vpc" {
  source = "./vpc"
  tags = {
    Name  = "requestor-vpc"   
  }
  vpc_cidr_block = "192.168.0.0/16"

}

#Provision Public subnet in the acceptor VPC. The AZ is automatically assigned
# within the module by using the data block aws_availability_zones
module "public-subnet-acceptor" {
  source = "./subnet"
  vpc_id = module.acceptor-vpc.vpc_id
  tags = {
    SecurityZone  = "Public-${module.acceptor-vpc.tags.Name}-subnet"
  }
    subnet_cidr_blocks = [ "172.16.1.0/24", "172.16.2.0/24" ]
}

#Provision Private subnet in the acceptor VPC. The AZ is automatically assigned
# within the module by using the data block aws_availability_zones

module "private-subnet-acceptor" {
  source = "./subnet"
  vpc_id = module.acceptor-vpc.vpc_id
    tags = {
    SecurityZone  = "Private-${module.acceptor-vpc.tags.Name}-subnet" 
  }
  subnet_cidr_blocks = [ "172.16.3.0/24", "172.16.4.0/24" ]
}

#Provision Public subnet in the requestor VPC. The AZ is automatically assigned
# within the module by using the data block aws_availability_zones

module "public-subnet-requestor" {
  source = "./subnet"
  vpc_id = module.requestor-vpc.vpc_id
    tags = {
    SecurityZone  ="Public-${module.requestor-vpc.tags.Name}-subnet" 
    }  
    subnet_cidr_blocks = [ "192.168.1.0/24", "192.168.2.0/24" ]
  
}

#Provision Private subnet in the requestor VPC. The AZ is automatically assigned
# within the module by using the data block aws_availability_zones
module "private-subnet-requestor" {
  source = "./subnet"
  vpc_id = module.requestor-vpc.vpc_id
    tags = {
    SecurityZone  = "Private-${module.requestor-vpc.tags.Name}-subnet" 
    }
    subnet_cidr_blocks = [ "192.168.3.0/24", "192.168.4.0/24" ]
  
}


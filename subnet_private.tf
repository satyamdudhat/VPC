resource "aws_subnet" "vpc_private_subnet" {
    count = length(var.private_subnets_cidr)
    vpc_id = aws_vpc.vpc.id
    cidr_block = element(var.private_subnets_cidr,count.index)
    availability_zone = element(var.availability_zones,count.index)

  tags = {
    Name = "Private_Subnet ${count.index + 1}"
  }
}
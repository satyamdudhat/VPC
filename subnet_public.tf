resource "aws_subnet" "vpc_public_subnet" {
  count = length(var.public_subnets_cidr)
  vpc_id = aws_vpc.vpc.id
  cidr_block = element(var.public_subnets_cidr,count.index)
  availability_zone = element(var.availability_zones,count.index)

  tags = {
    Name = "Public_Subnet ${count.index + 1}"
  }
}
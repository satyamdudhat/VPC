resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"                                                                                                                                                                                                                                                                                                    
    gateway_id = aws_internet_gateway.gateway.id
  }
  tags = {
    Name = "This is an public route table"
  }
}

resource "aws_route_table_association" "public_subnet" {                                            
    count = length(var.public_subnets_cidr)
    depends_on = [ aws_subnet.vpc_public_subnet, aws_route_table.public_route_table ]
    subnet_id = element(aws_subnet.vpc_public_subnet[*].id, count.index)
    route_table_id = aws_route_table.public_route_table.id
}














# ------------------------------------------Private-----------------------------------------------

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  depends_on = [ aws_nat_gateway.nat_gateway ]
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
   tags = {
    Name = "This is an private route table"
  }
}

resource "aws_route_table_association" "private_subnet" {                                            
    count = length(var.private_subnets_cidr)
    depends_on = [ aws_subnet.vpc_private_subnet, aws_route_table.private_route_table ]
    subnet_id = element(aws_subnet.private_subnet[*].id, count.index)
    route_table_id = aws_route_table.private_route_table.id
}

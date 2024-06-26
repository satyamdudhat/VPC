resource "aws_nat_gateway" "nat_gateway" {
    allocation_id = aws_eip.eip.id
    subnet_id = aws_subnet.vpc_public_subnet[0].id
    tags = {
        Name = "nat_gateway"
    }
}
resource "aws_eip" "eip" {
  domain = "vpc"
  tags = {
    Name = "nat_eip"
  }
}
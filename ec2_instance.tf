data "aws_subnet" "vpc_public_subnet" {
  filter {
    name = "tag:Name"
    values = [ "Public_Subnet 1" ]
  }
  depends_on = [ aws_route_table_association.public_subnet_asso ]
}
# Base on the tag name we are doinf a fertiler to get a particalr resurce or id data we use data block to fecth a data 


resource "aws_instance" "ec2_instance_vpc" {
  ami = "ami-09298640a92b2d12c"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  tags = {
    Name = "ec2_instance_vpc"
  }
  subnet_id = data.aws_subnet.vpc_public_subnet.id
  vpc_security_group_ids = [ aws_security_group.security_group_vpc_Instance.id ]
}

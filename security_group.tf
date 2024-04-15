resource "aws_security_group" "security_group_vpc_Instance" {
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" // Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Allowing SSH from any IP
  }

  vpc_id = aws_vpc.vpc.id
  depends_on = [aws_vpc.vpc]

  tags = {
    Name = "vpc_instance_security_group"
  }
}

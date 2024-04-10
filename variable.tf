variable "vpc_cidr" {
  type = string
  description = "I got a 4096 IP"
  default = "10.0.0.0/26"
}


variable "availability_zones" {
  type = list(string)
  default = [ "ap-south-1a","ap-south-1b" ]
}


variable "public_subnets_cidr" {
  type = list(string)
  default = [ "10.0.0.0/28", "10.0.0.16/28"]
}

variable "private_subnets_cidr" {
  type = list(string)
  default = [ "10.0.0.32/28", "10.0.0.48/28"]
}
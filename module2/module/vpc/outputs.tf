output "aws_vpc_details" {
  value = {
    vpc_id = aws_vpc.vpc.id
    public_cidr_id = {
      for k, v in aws_subnet.public : k => v.id
    }
  }
}
module "sg" {
  source = "./module/sg"
  vpc_id = module.vpc.aws_vpc_details.vpc_id
  app = "web"
  env = "prod"
  ingress-rule = [
    {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    description = "allow SSH"
    cidr_blocks = ["0.0.0.0/0"]
    },
    {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    description = "allow HTTP"
    cidr_blocks = ["0.0.0.0/0"]
    },
    {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    description = "allow Jenkins"
    cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress-rule = [
    {
    from_port = 0
    to_port = 0
    protocol = "-1"
    description = "allow outbound"
    cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
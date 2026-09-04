module "vpc" {
  source = "./module/vpc"
  vpc_cidr_range = "10.0.0.0/16"
public_cidr_range = [
    "10.0.1.0/24",
    "10.0.2.0/24"
]
private_cidr_range = [
    "10.0.11.0/24",
    "10.0.12.0/24"
]
app = "web"
env = "prod"
}
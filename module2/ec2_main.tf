module "ec2" {
  source = "./module/ec2"
  ami_id = "ami-01a00762f46d584a1"
  instance_type = [
    "m7i-flex.large" ]
  key_name = module.key_pair.key_name
  sg_id = module.sg.sg_details
  ec2_ami_profile = module.iam.ec2_iam_profile
  root_volume_size = 8
  root_volume_type = "gp3"
  env = "prod"
  app = "web"
  subnet_id = module.vpc.aws_vpc_details.public_cidr_id[0]
#   instance_count = 2
}
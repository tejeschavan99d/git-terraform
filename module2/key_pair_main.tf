module "key_pair" {
  source = "./module/key_pair"
  app = "web"
  env = "prod"
  key_path = "/Users/tejes/Downloads/terraform/module2/module/key_pair/terra-key-ec2.pub"
}
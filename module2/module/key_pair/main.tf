resource "aws_key_pair" "ec2_key" {
  key_name = "ec2_key"
  public_key = file(var.key_path)
  tags = {
    name = var.app
    env = var.env
  }
}
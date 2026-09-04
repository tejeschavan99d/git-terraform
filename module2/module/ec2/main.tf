resource "aws_instance" "ec2" {
  ami = var.ami_id
  count = length(var.instance_type)
  instance_type = var.instance_type[count.index]
  key_name = var.key_name
  vpc_security_group_ids = [var.sg_id]
  subnet_id = var.subnet_id
#   count = var.instance_count
  iam_instance_profile = var.ec2_ami_profile
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }
  tags = {
    Name = "${var.env}-${var.app}-instance-${count.index + 1}"
  }
}
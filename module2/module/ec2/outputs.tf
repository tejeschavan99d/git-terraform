output "ec2_details" {
  value = {
    instance_id = {
      for k, v in aws_instance.ec2 : k => v.id
    } #aws_instance.ec2.id
    public_dns = {
      for k,v in aws_instance.ec2 : k => v.public_dns
    } # aws_instance.ec2.public_dns
    public_ip = {
      for k,v in aws_instance.ec2 : k => v.public_ip
    }
    #aws_instance.ec2.public_ip
    subnet_id = {
      for k,v in aws_instance.ec2 : k => v.subnet_id
    }# aws_instance.ec2.subnet_id
  }
}

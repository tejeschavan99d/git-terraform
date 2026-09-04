output "s3_bucket_name" {
  value = {
    bucket_name = module.s3.s3_bucket
}
}
output "VPC_output" {
  value = {
    vpc_id = module.vpc.aws_vpc_details.vpc_id
    public_subnet_id = module.vpc.aws_vpc_details.public_cidr_id
}
}
output "sg_details" {
  value = {
    sg_id = module.sg.sg_details
}
}
output "key_name" {
  value = module.key_pair.key_name
  
}
output "ec2_details" {
  value = module.ec2.ec2_details
}
output "ec2_iam_profile" {
  value = module.iam.ec2_iam_profile
}
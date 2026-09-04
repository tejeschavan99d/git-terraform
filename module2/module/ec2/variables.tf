variable "app" {
  type = string
}
variable "env" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = list(string)
}
variable "root_volume_size" {
  type = number
}
variable "root_volume_type" {
  type = string
}
variable "key_name" {
  type = string
}
variable "sg_id" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "ec2_ami_profile" {
  type = string
}
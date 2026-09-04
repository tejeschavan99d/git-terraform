variable "vpc_cidr_range" {
  type = string
}
variable "public_cidr_range" {
  type = list(string)
}
variable "private_cidr_range" {
  type = list(string)
}
variable "app" {
  type = string
}
variable "env" {
  type = string
}
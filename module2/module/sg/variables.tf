variable "vpc_id" {
  type = string
}
variable "app" {
  type = string
}
variable "env" {
  type = string
}
variable "ingress-rule" {
  type = list(object({
    from_port = number
    to_port = number 
    description = string
    cidr_blocks = list(string)
    protocol = string
  }))
}
variable "egress-rule" {
  type = list(object({
    from_port = number
    to_port = number 
    description = string
    cidr_blocks = list(string)
    protocol = string
  }))
}
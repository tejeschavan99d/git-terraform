resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id
  name = "${var.app}-${var.env}-sg"
  description = "allow traffic"
  dynamic "ingress" {
    for_each = var.ingress-rule
    content {
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      cidr_blocks = ingress.value.cidr_blocks
      protocol = ingress.value.protocol
      description = ingress.value.description
    }
  }
  dynamic "egress" {
    for_each = var.egress-rule
    content {
      from_port = egress.value.from_port
      to_port = egress.value.to_port
      cidr_blocks = egress.value.cidr_blocks
      protocol = egress.value.protocol
      description = egress.value.description
    }
}
}
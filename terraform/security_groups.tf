resource "aws_security_group" "allow_traffic" {
  name        = "Dynamic_sg_allow_traffic"
  description = "Allow HTTP via terraform"
  vpc_id      = data.aws_vpc.default.id

  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "All outbound allowed"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
  tags = {
    Name = "Dynamic_created_sg_allow_http/s"
  }
}

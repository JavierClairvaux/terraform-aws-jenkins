resource "aws_security_group" "jk_sg" {
  name = "JenkinsCI security group"
}

resource "aws_security_group_rule" "allow_jk_8080_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.jk_sg.id
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_jk_ssh_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.jk_sg.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "allow_jk_all_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.jk_sg.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

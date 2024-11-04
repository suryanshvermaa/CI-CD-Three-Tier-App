resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing ssh port for remote connection"
    vpc_id = aws_default_vpc.default.id
    tags = {
      Name ="allow_ssh"
    }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
    security_group_id = aws_security_group.allow_ssh.id
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv6" {
    security_group_id = aws_security_group.allow_ssh.id
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
    cidr_ipv6 = "::/0"
}

resource "aws_vpc_security_group_egress_rule" "allowing_all_out_traffic_ipv4" {
    security_group_id = aws_security_group.allow_ssh.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allowing_all_out_traffic_ipv6" {
    security_group_id = aws_security_group.allow_ssh.id
    cidr_ipv6 = "::/0"
    ip_protocol = "-1"
}
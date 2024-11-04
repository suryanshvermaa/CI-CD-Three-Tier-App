resource "aws_instance" "jenkins-master-machine" {
    ami = var.ami_id
    key_name = aws_key_pair.jenkins-master-machine-key-pair.key_name
    security_groups = [aws_security_group.allow_ssh.name]
    instance_type = var.intance_type
    tags = {
        Name = var.machine_name
    }
}

output "jenkins-master-machine-public-ip" {
    value = aws_instance.jenkins-master-machine.public_ip
}
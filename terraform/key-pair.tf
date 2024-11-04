resource "aws_key_pair" "jenkins-master-machine-key-pair" {
    key_name = "jenkins-master-key"
    public_key = file("C:/Users/surya/.ssh/jenkins-master.pub")
}
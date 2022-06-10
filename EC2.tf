# Creating 1st EC2 instance in Private Subnet -1
resource "aws_instance" "demoinstance" {
  ami                         = "ami-087c17d1fe0178315" # specify the most updated AMI
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "tests"
  vpc_security_group_ids      = ["${aws_security_group.ec2sg.id}"]
  subnet_id                   = "${aws_subnet.private-subnet-1.id}"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"
tags = {
    Name = "Private Instance"
  }
}
# Creating 2nd EC2 instance in Private Subnet -2
resource "aws_instance" "demoinstance1" {
  ami                         = "ami-087c17d1fe0178315" #specify the most updated AMI
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "tests"
  vpc_security_group_ids      = ["${aws_security_group.ec2sg.id}"]
  subnet_id                   = "${aws_subnet.private-subnet-2.id}"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"
tags = {
    Name = "Private Instance 2"
  }
}
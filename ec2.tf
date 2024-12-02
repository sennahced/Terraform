resource "aws_instance" "AD_AMI" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.AD_subnet-1.id
  associate_public_ip_address = true
  tags = {
    Name = "AD_AMI"
  }
}

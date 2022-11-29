resource "aws_instance" "dev_machine" {
  ami = "ami-094125af156557ca2"
  instance_type = "t2.micro"
  subnet_id  = aws_subnet.project-subnet-public1-us-west-2a.id
  associate_public_ip_address = true
  availability_zone = "us-west-2a"
  key_name = "EC2_Oregon"

  tags = {
    Environment = "dev"
  }
}

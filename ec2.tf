resource "aws_instance" "dev_machine" {
  ami = "ami-094125af156557ca2"
  instance_type = "t2.micro"
  subnet_id  = aws_subnet.dev-public-1.id
  key_name = "EC2_Oregon"

  tags = {
    Environment = "dev"
    Name = "TF-server"
  }
}

resource "aws_instance" "dev_machine" {
  ami = ami-094125af156557ca2
  instance_type = "t2.micro"
  key_name = "EC2_Oregon"

  tags = {
    Environment = "dev"
    Name = "TF-server"
  }
}

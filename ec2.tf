resource "aws_instance" "dev_machine" {
  ami = "ami-074dc0a6f6c764218"
  instance_type = "t2.micro"
  subnet_id  = aws_subnet.dev-public-1.id
  key_name = "EC2_Mumbai_dp"

  tags = {
    Environment = "dev"
  }
}

resource "aws_instance" "dev_machine" {
  ami = "ami-094125af156557ca2"
  instance_type = "t2.micro"
  vpc_id = "vpc-092ff930d4461e6f3"
  subnet_id = "subnet-069e212944d2fd228"
  associate_public_ip_address = true
  availability_zone = "us-west-2a"
  key_name = "EC2_Oregon"

  tags = {
    Environment = "dev"
  }
}

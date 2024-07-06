resource "aws_instance" "instance1" {
  ami                         = "ami-0195204d5dce06d99"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "test instance"
  vpc_security_group_ids     = ["sg-08aa748db9387b70c"]
  subnet_id                   = "subnet-05365330db8cfbda9"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"

  tags = {
    Name = "vasanth"
  }
}

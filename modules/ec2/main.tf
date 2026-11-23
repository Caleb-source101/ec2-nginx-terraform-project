resource "aws_key_pair" "one" {
  key_name   = "one-key"
  public_key = file(var.key_path)
}

data "aws_ami" "one" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-resolute-26.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "one" {
  ami                    = data.aws_ami.one.id
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = aws_key_pair.one.key_name

  tags = {
  Name = "TF-EC2"
 }
}


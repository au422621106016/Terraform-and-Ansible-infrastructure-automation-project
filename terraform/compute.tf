resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "web" {
  ami                    = "ami-091138d0f0d41ff90"
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  key_name = aws_key_pair.deployer.key_name

  root_block_device {
    volume_size = 10
    volume_type = "gp3"

  }
  tags = {
    Name = "devops-task-platform"
  }
}

data  "aws_eip" "existing_eip" {
  public_ip = "44.210.40.108"
  
}
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = data.aws_eip.existing_eip.id
}
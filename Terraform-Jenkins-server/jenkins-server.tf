data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "socks_shop_server" {
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = var.instance_type
  key_name                    = "jenkins-server"
  subnet_id                   = aws_subnet.socks-shop-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  # user_data                   = file("jenkins-server-script.sh")

  tags = {
    Name = "jenkins-server"
  }
}

# an empty resource block
resource "null_resource" "name" {

  # ssh into the ec2 instance 
  connection {
    type        = "ssh"
    user        = "ec2'user"
    private_key = file("~/Downloads/Jenkin-server.pem")
    host        = aws_instance.esocks_shop_server.public.id
  }

# copy the install_jenkins.sh file from your computer to the ec2 instance 
provisioner  "file" { 
  source      = "Jenkins-Server.sh"
  destination = "/tmp/Jenkins-Server.sh"
  }

  # set permissions and run the install_jenkins.sh file
provisioner "remote-exec" {
  inline = [
     "sudo chmod +x /tmp/Jenkins-Server.sh",
     "sh /tmp/Jenkins-Server.sh"
    ]
  }

  # wait for ec2 to be created
depends_on = [aws_ami.amazon_linux_2]

}




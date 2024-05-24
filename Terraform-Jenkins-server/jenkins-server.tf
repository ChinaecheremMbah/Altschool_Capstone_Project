data "aws_ami" "amazon_linux_2" {
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
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.instance_type
  key_name                    = "jenkins-server"
  subnet_id                   = aws_subnet.socks_shop_server.id
  vpc_security_group_ids      = [socks_shop_vpc.public.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  # user_data                   = file("jenkins-server-script.sh")

  tags = {
    Name = "jenkins-server"
  }
}

# an empty resource block
resource "null_resource" "socks_shop" {

  # ssh into the ec2 instance 
  connection {
    type        = "ssh"
    user        = "ec2'user"
    private_key = file("~/Downloads/Jenkin-server.pem")
    host        = aws_instance.socks_shop_server.id
  }

# copy the install_jenkins.sh file from your computer to the ec2 instance 
provisioner  "file" { 
  source      = "Jenkins-Server.sh"
  destination = "/Terraform-Jenkins-server/Jenkins-Server.sh"
  }

  # set permissions and run the install_jenkins.sh file
provisioner "remote-exec" {
  inline = [
     "sudo chmod +x /Terraform-Jenkins-server/Jenkins-Server.sh",
     "sh /Terraform-Jenkins-server/Jenkins-Server.sh"
    ]
  }

  # wait for ec2 to be created
depends_on = [aws_ami.amazon_linux_2]

}




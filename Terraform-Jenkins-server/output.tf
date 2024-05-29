output "ec2_public_ip" {
  value = aws_instance.socks_shop_server.id
}

# print the url of the jenkins server
output "website_url" {
  value = join("", ["http://", aws_instance.socks_shop_server.public_dns, ":", "8080"])
}
output "ec2_private_key_pem" {
  value     = tls_private_key.my_key.private_key_pem
  sensitive = true
}
output "ec2_instance_id" {
  value = aws_instance.my_ec2.id
}

output "ec2_public_ip" {
  value = aws_instance.my_ec2.public_ip
}

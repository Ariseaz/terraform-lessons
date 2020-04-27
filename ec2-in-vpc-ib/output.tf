output "ELB" {
  value = aws_elb.my-elb.dns_name
}

output "public_ip" {
  value = aws_instance.Bastion.public_ip
}


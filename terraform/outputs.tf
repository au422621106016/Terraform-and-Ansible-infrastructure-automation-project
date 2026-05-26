output "elastic_ip" {
  value = data.aws_eip.existing_eip.public_ip
}
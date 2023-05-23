output "server_public_ip" {
	value = aws_instance.server_instance.public_ip
}

output "client_public_ip" {
	value = aws_instance.client_instance.public_ip
}
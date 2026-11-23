output "subnet_id" {
  description = "ID of the subnet"
  value       = aws_subnet.one.id
}

output "security_group_id" {
  description = "Id of the security group"
  value       = aws_security_group.one.id
}

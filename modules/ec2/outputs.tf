output "aws_instance_id" {
  description = "The ID for the Ubuntu EC2 instance"
  value       = aws_instance.one.id
}
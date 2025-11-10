output "alb_dns_name" {
  description = "DNS name del Application Load Balancer"
  value       = aws_lb.dev_flexgateway_alb.dns_name
}

output "alb_security_group_id" {
  description = "ID del Security Group del ALB"
  value       = aws_security_group.dev_flexgateway_alb_sg.id
}

output "ec2_security_group_id" {
  description = "ID del Security Group de las instancias EC2"
  value       = aws_security_group.dev_flexgateway_ec2_sg.id
}

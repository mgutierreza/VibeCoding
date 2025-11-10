# Security Group para el ALB
resource "aws_security_group" "dev_flexgateway_alb_sg" {
  name        = "dev-flexgateway-alb-sg"
  description = "Security group para el ALB, permite trafico en el puerto 8081"

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group para las instancias EC2
resource "aws_security_group" "dev_flexgateway_ec2_sg" {
  name        = "dev-flexgateway-ec2-sg"
  description = "Security group para las instancias EC2, permite trafico solo desde el ALB"

  ingress {
    from_port       = 8081
    to_port         = 8081
    protocol        = "tcp"
    security_groups = [aws_security_group.dev_flexgateway_alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

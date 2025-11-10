# Application Load Balancer
resource "aws_lb" "dev_flexgateway_alb" {
  name               = "dev-flexgateway-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.dev_flexgateway_alb_sg.id]
  subnets            = var.subnets
}

# Target Group para el ALB
resource "aws_lb_target_group" "dev_flexgateway_tg" {
  name     = "dev-flexgateway-tg"
  port     = 8081
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# Listener para el ALB
resource "aws_lb_listener" "dev_flexgateway_listener" {
  load_balancer_arn = aws_lb.dev_flexgateway_alb.arn
  port              = "8081"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.dev_flexgateway_tg.arn
  }
}

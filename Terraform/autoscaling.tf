# Auto Scaling Group
resource "aws_autoscaling_group" "dev_flexgateway_asg" {
  name                = "dev-flexgateway-asg"
  min_size            = 1
  max_size            = 1
  desired_capacity    = 1
  vpc_zone_identifier = var.subnets

  launch_template {
    id      = aws_launch_template.dev_flexgateway_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.dev_flexgateway_tg.arn]
}

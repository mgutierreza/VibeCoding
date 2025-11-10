# Launch Template para las instancias EC2
resource "aws_launch_template" "dev_flexgateway_lt" {
  name          = "dev-flexgateway-lt"
  image_id      = var.ami_id
  instance_type = "t3.micro"
  key_name      = var.key_pair

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.dev_flexgateway_ec2_sg.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "dev-flexgateway-ec2"
    }
  }
}

resource "aws_lb" "ALB" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"

  subnets = [
    aws_subnet.public_subnet01.id,
    aws_subnet.public_subnet02.id
  ]

  tags = {
    Name = "my-alb"
  }
}

resource "aws_lb_target_group" "target_group" {
  name     = "my-targets"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    path     = "/"
    protocol = "HTTP"
    port     = "80"
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

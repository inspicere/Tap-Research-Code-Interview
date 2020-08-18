##################################################################
# AWS Application Load Balancer
##################################################################

resource "aws_alb" "alb" {
  name     = ""
  subnets  = [var.aws_pub_subnet_2_cidr]
  internal = false
#  security_groups = [aws_security_group.alb.id]
}

resource "aws_alb_target_group" "target" {
  port = 8080
  protocol = "HTTP"
  vpc_id = module.vpc.vpc_id
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    path                = "/"
    interval            = 30
    port                = 80
    matcher             = "200-399"
  }
  stickiness {
    type = "lb_cookie"
    enabled = true
  }
}

resource "aws_alb_target_group_attachment" "attach_web" {
  target_group_arn = aws_alb_target_group.target.arn
  target_id = module.ec2-web.id.*[count.index]
  port = 80
  count = 3
}

resource "aws_alb_listener" "frontend_http" {
  default_action {
    target_group_arn = aws_alb_target_group.target.arn
    type = "forward"
  }
  load_balancer_arn = aws_alb.alb.arn
  port = 80
 }

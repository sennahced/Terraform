resource "aws_lb" "LB-AD" {
  name               = "LB-AD"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.AD_security_group.id]
  subnets            = [
    aws_subnet.AD_subnet-1.id,
    aws_subnet.AD_subnet-2.id,
    aws_subnet.AD_subnet-3.id
  ]

  enable_deletion_protection = false

    tags = {
        Name = "LB-AD"
    }

}
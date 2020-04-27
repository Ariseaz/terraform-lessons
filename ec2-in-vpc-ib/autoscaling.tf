resource "aws_launch_configuration" "azeez-launchconfig" {
  name_prefix     = "azeez-launchconfig"
  image_id        = var.AMIS[var.AWS_REGION]
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.mykeypair.key_name
  security_groups = [aws_security_group.myinstance.id]
  # role:
  iam_instance_profile = aws_iam_instance_profile.s3-azbucket-role-instanceprofile.name
  user_data       = "#!/bin/bash\napt-get update\napt-get -y install nginx\nMYIP=`ifconfig | grep 'addr:10' | awk '{ print $2 }' | cut -d ':' -f2`\necho 'this is: '$MYIP > /var/www/html/index.html"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "azeez-autoscaling" {
  name                      = "azeez-autoscaling"
  vpc_zone_identifier       = [aws_subnet.projectib-private-1.id, aws_subnet.projectib-private-2.id]
  launch_configuration      = aws_launch_configuration.azeez-launchconfig.name
  min_size                  = 4
  max_size                  = 8
  health_check_grace_period = 300
  health_check_type         = "ELB"
  load_balancers            = [aws_elb.my-elb.name]
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}


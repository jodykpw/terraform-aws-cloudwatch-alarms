# CloudWatch Alarms for Autoscaling Groups

# Scale Out Alarm
resource "aws_autoscaling_policy" "ec2-scale-out" {
  name                   = "ec2-scale-up"
  scaling_adjustment     = "1"
  adjustment_type        = "ChangeInCapacity"
  cooldown               = "300"
  autoscaling_group_name = aws_autoscaling_group.asg.name 
}

# Cloud Watch Alarm to trigger the above scaling policy when CPU Utilization is above 80%
# Also send the notificaiton email to users present in SNS Topic Subscription
resource "aws_cloudwatch_metric_alarm" "cpu-policy-scale-out" {
  alarm_name          = "cpu-policy-scale-out"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name 
  }

  alarm_description = "This metric monitors ec2 cpu utilization and triggers the ASG Scaling policy to scale-out if CPU is above 80%"
  
  ok_actions          = [aws_sns_topic.asg_sns_topic.arn]  
  alarm_actions     = [
    aws_autoscaling_policy.ec2-scale-out.arn, 
    aws_sns_topic.asg_sns_topic.arn
  ]
}

# Scale In Alarm
resource "aws_autoscaling_policy" "ec2-scale-in" {
  name                   = "ec2-scale-in"
  scaling_adjustment     = "-1"
  adjustment_type        = "ChangeInCapacity"
  cooldown               = "300"
  autoscaling_group_name = aws_autoscaling_group.asg.name 
}

# Cloud Watch Alarm to trigger the above scaling policy when CPU Utilization is below 50%
# Also send the notificaiton email to users present in SNS Topic Subscription
resource "aws_cloudwatch_metric_alarm" "cpu-policy-scale-in" {
  alarm_name          = "cpu-policy-scale-in"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "50"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name 
  }

  alarm_description = "This metric monitors ec2 cpu utilization and triggers the ASG Scaling policy to scale-in if CPU is below 50%"
  
  ok_actions          = [aws_sns_topic.asg_sns_topic.arn]  
  alarm_actions     = [
    aws_autoscaling_policy.ec2-scale-in.arn, 
    aws_sns_topic.asg_sns_topic.arn
  ]
}
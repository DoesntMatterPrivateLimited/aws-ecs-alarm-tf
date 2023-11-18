resource "aws_cloudwatch_event_rule" "ecs_task_state_change_rule" {
  name        = "ECS_Task_State_Change_Rule"
  description = "EventBridge rule for ECS Task State Change"

  event_pattern = <<PATTERN
{
  "source": ["aws.ecs"],
  "detail-type": ["ECS Task State Change"],
  "detail": {
    "lastStatus": ["STOPPED"],
    "stoppedReason": [
      "Essential container in task exited",
      "Task stopped by user",
      "CannotPullContainerError",
      "Failed Elastic Load Balancing (ELB) health checks",
      "Failed container health checks",
      "Unhealthy container instance",
      "Underlying infrastructure maintenance",
      "Service scaling event triggered",
      "ResourceInitializationError"
    ]
  }
}
PATTERN
}

resource "aws_cloudwatch_event_target" "sns_target" {
  rule = aws_cloudwatch_event_rule.ecs_task_state_change_rule.name
  arn  = "arn:aws:sns:us-east-1:376476525700:TaskFailedAlarm"
  target_id = "SNS_Topic_Target"
  # Here, replace the ARN with the actual ARN of your SNS topic
}


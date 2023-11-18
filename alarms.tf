resource "aws_cloudwatch_metric_alarm" "cpu_utilization_high" {
  # Provides a CloudWatch Metric Alarm resource.
  count = var.module_enabled ? 1 : 0

  # (Required) The descriptive name for the alarm. This name must be unique within the user's AWS account
  alarm_name = "${var.ecs_service_name != "" ? var.ecs_service_name : var.ecs_cluster_name}-cpu-utilization-high"
  # (Required) The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified
  # Statistic value is used as the first operand. Either of the following is supported:
  #   * GreaterThanOrEqualToThreshold
  #   * GreaterThanThreshold
  #   * LessThanThreshold
  #   * LessThanOrEqualToThreshold.
  comparison_operator = "GreaterThanThreshold"
  # (Required) The number of periods over which data is compared to the specified threshold.
  evaluation_periods = var.cpu_utilization_high_evaluation_periods
  # (Optional) The name for the alarm's associated metric. See docs for supported metrics:
  #   * https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html
  metric_name = "CPUUtilization"
  # (Optional) The namespace for the alarm's associated metric. See docs for the list of namespaces:
  #   * https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/aws-namespaces.html
  namespace = "AWS/ECS"
  # (Optional) The period in seconds over which the specified `statistic` is applied.
  period = var.cpu_utilization_high_period
  # (Optional) The statistic to apply to the alarm's associated metric. Either of the following is supported:
  #   * SampleCount
  #   * Average
  #   * Sum
  #   * Minimum
  #   * Maximum
  statistic = "Average"
  # (Required) The value against which the specified statistic is compared.
  threshold = var.cpu_utilization_high_threshold

  # (Optional) The list of actions to execute when this alarm transitions into an ALARM state from any other state.
  # Each action is specified as an Amazon Resource Name (ARN).
  alarm_actions = var.alarm_actions
  # (Optional) The list of actions to execute when this alarm transitions into an OK state from any other state.
  # Each action is specified as an Amazon Resource Name (ARN).
  ok_actions = var.ok_actions
  # (Optional) The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any
  # other state. Each action is specified as an Amazon Resource Name (ARN).
  insufficient_data_actions = var.insufficient_data_actions

  # (Optional) The description for the alarm.
  alarm_description = format(
    var.alarm_description,
    var.ecs_service_name != "" ? "Service" : "Cluster",
    var.ecs_service_name != "" ? var.ecs_service_name : var.ecs_cluster_name,
    "CPU Utilization",
    "HIGH",
    var.cpu_utilization_high_period / 60,
    var.cpu_utilization_high_evaluation_periods,
    ""
  )

  # (Optional) The dimensions for the alarm's associated metric. For the list of available dimensions see the AWS
  # documentation:
  #   * http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html
  dimensions = local.dimensions_map[var.ecs_service_name == "" ? "cluster" : "service"]

  tags = merge(
    local.tags,
    {
      Name = "${var.ecs_service_name != "" ? var.ecs_service_name : var.ecs_cluster_name}-cpu-utilization-high"
    }
  )
}

resource "aws_cloudwatch_metric_alarm" "memory_utilization_high" {
  count = var.module_enabled ? 1 : 0

  alarm_name          = "${var.ecs_service_name != "" ? var.ecs_service_name : var.ecs_cluster_name}-memory-utilization-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.memory_utilization_high_evaluation_periods
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = var.memory_utilization_high_period
  statistic           = "Average"
  threshold           = var.memory_utilization_high_threshold

  alarm_actions             = var.alarm_actions
  ok_actions                = var.ok_actions
  insufficient_data_actions = var.insufficient_data_actions

  alarm_description = format(
    var.alarm_description,
    var.ecs_service_name != "" ? "Service" : "Cluster",
    var.ecs_service_name != "" ? var.ecs_service_name : var.ecs_cluster_name,
    "Memory Utilization",
    "HIGH",
    var.memory_utilization_high_period / 60,
    var.memory_utilization_high_evaluation_periods,
    ""
  )

  dimensions = local.dimensions_map[var.ecs_service_name == "" ? "cluster" : "service"]

  tags = merge(
    local.tags,
    {
      Name = "${var.ecs_service_name != "" ? var.ecs_service_name : var.ecs_cluster_name}-memory-utilization-high"
    }
  )
}

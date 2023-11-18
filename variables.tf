variable "module_enabled" {
  description = "Whether to create or destroy the resources during apply operation."
  type        = bool
  default     = true
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster to monitor."
  type        = string
}
variable "ecs_service_name" {
  description = "The name of the ECS Service in the ECS cluster to monitor."
  type        = string
  default     = ""
}
variable "ecs_service_arn" {
  description = "The ID (ARN) of the ECS Service in the ECS cluster to watch events."
  type        = string
  default     = ""
}

variable "alarm_actions" {
  description = "The list of actions ARNs to execute when this alarm transitions into an ALARM state from any other state."
  type        = list(string)
  default     = []
}
variable "ok_actions" {
  description = "The list of actions ARNs to execute when this alarm transitions into an OK state from any other state."
  type        = list(string)
  default     = []
}
variable "insufficient_data_actions" {
  description = "The list of actions ARNs to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state."
  type        = list(string)
  default     = []
}

variable "alarm_description" {
  type        = string
  description = "The string to format and use as the alarm description."
  default     = "Average ECS %v [%v] %v is too %v for the last %d minute(s) over %v period(s)%s"
}

variable "cpu_utilization_high_threshold" {
  description = "The maximum percentage of CPU utilization."
  type        = number
  default     = 90
}
variable "cpu_utilization_high_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold to evaluate for the alarm."
  type        = number
  default     = 1
}
variable "cpu_utilization_high_period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = number
  default     = 300
}

variable "memory_utilization_high_threshold" {
  type        = number
  description = "The maximum percentage of Memory utilization average"
  default     = 85
}
variable "memory_utilization_high_evaluation_periods" {
  type        = number
  description = "Number of periods to evaluate for the alarm"
  default     = 1
}
variable "memory_utilization_high_period" {
  type        = number
  description = "Duration in seconds to evaluate for the alarm"
  default     = 300
}

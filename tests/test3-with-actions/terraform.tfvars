# Whether to create or destroy the resources during apply operation.
module_enabled = true
# The name of the ECS cluster to monitor
ecs_cluster_name = "for-gitlab-ci-tests"
# The name of the ECS Service in the ECS cluster to monitor
ecs_service_name = "service-test3"
# The list of actions ARNs to execute when this alarm transitions into an ALARM state from any other state.
alarm_actions= [
  "arn:aws:sns:us-east-1:333333333333:AlarmTopic"
]
# "The list of actions ARNs to execute when this alarm transitions into an OK state from any other state."
ok_actions = []

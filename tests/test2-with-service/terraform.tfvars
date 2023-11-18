# Whether to create or destroy the resources during apply operation.
module_enabled = true
# The name of the ECS cluster to monitor
ecs_cluster_name = "for-gitlab-ci-tests"
# The name of the ECS Service in the ECS cluster to monitor
ecs_service_name = "service-test2"
# The ID (ARN) of the ECS Service in the ECS cluster to watch events.
ecs_service_arn = "aws:arn::111222333456:service/cluster/id"

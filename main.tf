locals {
  tags = {
    terraform = "true"
  }

  dimensions_map = {
    "service" = {
      "ClusterName" = var.ecs_cluster_name
      "ServiceName" = var.ecs_service_name
    }
    "cluster" = {
      "ClusterName" = var.ecs_cluster_name
    }
  }
}

data "aws_ecs_cluster" "this" {
  # The ECS Cluster data source allows access to details of a specific cluster within an AWS ECS service.

  # (Required) The name of the ECS Cluster
  cluster_name = var.ecs_cluster_name
}

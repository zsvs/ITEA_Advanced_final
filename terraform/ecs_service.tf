resource "aws_ecs_service" "tg-bot-svc" {
  name                               = "tg-bot-svc"
  cluster                            = aws_ecs_cluster.app.arn
  task_definition                    = aws_ecs_task_definition.tg-bot.arn
  desired_count                      = 1
  scheduling_strategy                = "REPLICA"
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  launch_type                        = "FARGATE"

  depends_on = [aws_security_group.allow_traffic]

  network_configuration {
    security_groups  = [aws_security_group.allow_traffic.id]
    subnets          = data.aws_subnet.public_subnets.*.id
    assign_public_ip = true
  }

}

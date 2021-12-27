resource "aws_ecs_service" "tg-bot-svc" {
  name            = "tg-bot-svc"
  cluster         = aws_ecs_cluster.app.id
  task_definition = aws_ecs_task_definition.tg-bot.arn
  desired_count   = 1
}

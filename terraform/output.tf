output "aws_ecs_cluster_arn" {
  value = aws_ecs_cluster.app.arn
}

output "aws_ecs_cluster_id" {
  value = aws_ecs_cluster.app.id
}

output "aws_ecs_task_definition_arn" {
  value = aws_ecs_task_definition.tg-bot.arn
}

output "aws_ecs_task_definition_revision" {
  value = aws_ecs_task_definition.tg-bot.revision
}

output "aws_ecs_service_id" {
  value = aws_ecs_service.tg-bot-svc.id
}

output "aws_ecs_service_cluster" {
  value = aws_ecs_service.tg-bot-svc.cluster
}

output "aws_ecs_service_iam_role" {
  value = aws_ecs_service.tg-bot-svc.iam_role
}

output "aws_ecs_service_desired_cnt" {
  value = aws_ecs_service.tg-bot-svc.desired_count
}

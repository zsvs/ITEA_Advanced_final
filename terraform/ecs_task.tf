resource "aws_ecs_task_definition" "tg-bot" {
  family = "tg-bot_defenition"

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
  depends_on = [aws_ecs_service.tg-bot-svc]
  container_definitions = jsonencode([
    {
      name                    = "bot-task"
      requiresCompatibilities = ["FARGATE"],
      networkMode             = "awsvpc"
      image                   = "ghostsvsghost/pytgweatherbot:latest"
      cpu                     = 10
      memory                  = 512
      essential               = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        },
        {
          containerPort = 443
          hostPort      = 443
        }
      ],
      environment = [
        {
          name  = "OPENWEATHER_API_KEY",
          value = var.OPENWEATHER_API_KEY
        },
        {
          name  = "TG_API_KEY",
          value = var.TG_API_KEY
        }
      ]
    }
  ])
}

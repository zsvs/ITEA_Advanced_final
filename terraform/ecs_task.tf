resource "aws_ecs_task_definition" "tg-bot" {
  family = "tg-bot"
  container_definitions = jsonencode([
    {
      name                    = "bot"
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

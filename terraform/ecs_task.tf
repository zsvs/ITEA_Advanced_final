resource "aws_ecs_task_definition" "tg-bot" {
  family                   = "tg-bot-task-defenition"
  task_role_arn            = data.aws_iam_role.ecs_task_role.arn
  execution_role_arn       = data.aws_iam_role.ecs_task_role.arn
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 1024

  #!requiresCompatibilities = ["FARGATE"],
  #!networkMode             = "awsvpc"

  container_definitions = jsonencode([
    {
      name      = "tg-bot"
      image     = "ghostsvsghost/pytgweatherbot:latest"
      cpu       = 256
      memory    = 1024
      essential = true
      "logConfiguration" : {
        "logDriver" : "awslogs",
        "options" : {
          "awslogs-region" : "eu-west-1",
          "awslogs-group" : aws_cloudwatch_log_group.tg_bot_fargate_log.name,
          "awslogs-stream-prefix" : "bot"
        }
      },
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
      "runtimePlatform" : {
        "operatingSystemFamily" : "LINUX",
        "cpuArchitecture" : null
      },
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

provider "aws" {
  region = "eu-west-1"
}
resource "aws_ecs_cluster" "app" {
  name = "tg-bot-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

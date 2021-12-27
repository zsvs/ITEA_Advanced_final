resource "aws_kms_key" "log_key" {
  description             = "KMS for final project"
  deletion_window_in_days = 7
}
resource "aws_cloudwatch_log_group" "tg_bot_fargate_log" {
  name = "tg-bot-fargate-log"
}

resource "aws_s3_bucket" "itea_final_project" {
  bucket = "itea-final-project"
  acl    = "private"
}

resource "aws_ecs_cluster" "app" {
  name = "tg-bot-cluster"
  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.log_key.arn
      logging    = "OVERRIDE"

      log_configuration {
        s3_bucket_name             = aws_s3_bucket.itea_final_project.id
        cloud_watch_log_group_name = aws_cloudwatch_log_group.tg_bot_fargate_log.name
      }
    }
  }
}

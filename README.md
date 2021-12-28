[![Build and push application image](https://github.com/zsvs/ITEA_Advanced_final/actions/workflows/telegram-weather-bot-docker-build.yml/badge.svg?branch=master&event=push)](https://github.com/zsvs/ITEA_Advanced_final/actions/workflows/telegram-weather-bot-docker-build.yml)



[![Terraform](https://github.com/zsvs/ITEA_Advanced_final/actions/workflows/terraform.yml/badge.svg?branch=master&event=workflow_run)](https://github.com/zsvs/ITEA_Advanced_final/actions/workflows/terraform.yml)


# Final project for ITEA DevOps advanced course

---

Using: Terraform, AWS ECS Fargate cluster, AWS CloudWatch, AWS S3, Docker, Python 3.9.9

CI/CD: GitHub Actions

---

As backend for Terraform used Terraform Cloud.

A simple application that deploys to the AWS Fargate cluster. Developed on Python and uses Telegram and Openweather API for his work. 
For correct work, you need to set up a couple of environment variables for GitHub Actions:

- DOCKERHUB_USERNAME
- DOCKERHUB_PASSWORD

---

In Terraform Cloud you need to set up:

- AWS_ACCESS_KEY_ID
- AWS_DEFAULT_REGION
- AWS_SECRET_ACCESS_KEY

as environment variables for your workspace.

---

- TG_API_KEY
- OPENWEATHER_API_KEY

must be set as Terraform vars(without checking HCL)

